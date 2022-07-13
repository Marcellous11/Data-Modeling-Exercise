-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lAnXhv
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "regions" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "users" (
    "id" int   NOT NULL,
    "username" string   NOT NULL,
    "password" string   NOT NULL,
    "prefered_region" string   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "posts" (
    "id" int   NOT NULL,
    "title" string   NOT NULL,
    "descriptions" string   NOT NULL,
    "location" string   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "categories" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_region_id" FOREIGN KEY("region_id")
REFERENCES "regions" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category_id" FOREIGN KEY("category_id")
REFERENCES "categories" ("id");

