CREATE TABLE "countries" (
  "code" varchar(2) NOT NULL DEFAULT '',
  "name" varchar(45) NOT NULL,
  PRIMARY KEY ("code")
);

--
-- Dumping data for table "countries"
--

INSERT INTO "countries" VALUES ('at','Austria'),('au','Australia'),('be','Belgio'),('bo','Bolivia'),('ch','Svizzera'),('de','Germania'),('dk','Danimarca'),('ec','Ecuador'),('es','Spagna'),('fi','Finlandia'),('fr','Francia'),('gb','Inghilterra'),('gr','Grecia'),('hr','Croazia'),('ie','Irlanda'),('is','Islanda'),('it','Italia'),('ma','Marocco'),('mg','Madagascar'),('mx','Messico'),('nl','Olanda'),('pe','Perù'),('pl','Polonia'),('pt','Portogallo'),('ro','Romania'),('rs','Serbia'),('ru','Russia'),('se','Svezia'),('si','Slovenia'),('sk','Slovacchia'),('st','Sao Tomé e Principe'),('th','Thailandia'),('tr','Turchia'),('ua','Ucraina'),('us','USA'),('ve','Venezuela'),('vn','Vietnam');
