---DROP TABLE television;
---DROP TABLE television_smart;

CREATE TABLE television(
television_id SERIAL PRIMARY KEY,
catalog_number INTEGER NOT NULL,
brand_name TEXT NOT NULL,
model TEXT NOT NULL,
screen_size TEXT NOT NULL,
resolution TEXT NOT NULL,
stock_quantity INTEGER,
release_year INTEGER CHECK(release_year > 1950),
price INTEGER NOT NULL
);

CREATE TABLE television_smart(
television_id INTEGER PRIMARY KEY,
FOREIGN KEY(television_id) REFERENCES television(television_id),
smart_tv BOOLEAN NOT NULL,
os TEXT CHECK(smart_tv = FALSE OR os IS NOT NULL),
panel_type TEXT
);


INSERT INTO television(catalog_number,brand_name,model,screen_size,resolution,stock_quantity,release_year,price) VALUES
(2,'Sony','MODEL2','56','8K',60,2000,5999),
(3,'LG','MODEL3','62','14K',40,2020,2599),
(4,'Samsung','MODEL4','79','HD',70,2010,3999);

INSERT INTO television_smart(television_id,smart_tv,os,panel_type) VALUES
(1,TRUE,'osGoogleTV','OLED'),
(2,TRUE,'osGoogleTV','QLED'),
(3,FALSE,NULL,'LED');
