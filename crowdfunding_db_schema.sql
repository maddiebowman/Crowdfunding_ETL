-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XDKWAu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Create campaign table
CREATE TABLE "campaign" (
	"cf_id" INT NOT NULL, 
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(255)   NOT NULL,
    "description" TEXT   NOT NULL,
    "goal" NUMERIC(10,1) NOT NULL,
    "pledged" NUMERIC(10,1) NOT NULL,
    "outcome" VARCHAR(30)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(10)   NOT NULL,
    "currency" VARCHAR(10)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE  NOT NULL,
    "category_id" VARCHAR(30)   NOT NULL,
    "subcategory_id" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "contact_id"
     )
);

-- NOTE: Manually import campaign.csv after creating tables


-- Create category table

CREATE TABLE "category" (
    "category_id" VARCHAR(30)   NOT NULL,
    "category" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

-- NOTE: Manually import category.csv after creating tables


-- Create subcategory table

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(30)   NOT NULL,
    "subcategory" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

-- NOTE: Manually import subcategory.csv after creating tables


-- Create contacts table

CREATE TABLE "contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "email" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

-- NOTE: Manually import contacts.csv after creating tables



ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");



-- After, verify that each table has the correct data by running SELECT *

-- Display campaign table 
SELECT * FROM campaign;

-- Display category table 
SELECT * FROM category;

-- Display contacts table 
SELECT * FROM contacts;

-- Display subcategory table 
SELECT * FROM subcategory;
