---DROP TABLE television;
---DROP TABLE television_data;

CREATE TABLE television_coustomer(
television_id SERIAL PRIMARY KEY,
catalog_number INTEGER NOT NULL,
brand_name TEXT NOT NULL,
model TEXT NOT NULL,
screen_size TEXT NOT NULL,
resolution TEXT NOT NULL,
price INTEGER NOT NULL
);

CREATE TABLE television_data(
television_id INTEGER PRIMARY KEY,
FOREIGN KEY(television_id) REFERENCES television_coustomer(television_id),
release_year INTEGER CHECK(release_year > 1950),
smart_tv BOOL NOT NULL,
os TEXT CHECK(smart_tv = FALSE OR os IS NOT NULL),
panel_type TEXT,
stock_quantity INTEGER
);

INSERT INTO television_coustomer(catalog_number,brand_name,model,screen_size,resolution,price) VALUES
(2,'Sony','MODEL2','56','8K',5999),
(3,'LG','MODEL3','62','14K',2599),
(4,'Samsung','MODEL4','79','HD',3999);

INSERT INTO television_data(television_id,stock_quantity,release_year,smart_tv,os,panel_type) VALUES
(1,60,2000,TRUE,'osGoogleTV','OLED'),
(2,40,2020,TRUE,'osGoogleTV','QLED'),
(3,70,2010,FALSE,NULL,'LED');
