DROP DATABASE IF EXISTS  craigs_list;

CREATE DATABASE craigs_list;

\c craigs_list;

CREATE TABLE "craigslist" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "post_id" int,
  "region_id" int,
  "category_id" int
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "post" (
  "id" SERIAL PRIMARY KEY,
  "title" text NOT NULL,
  "post_text" text NOT NULL,
  "location" text
);

CREATE TABLE "regions" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "prefered_region" int
);

ALTER TABLE "craigslist" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "craigslist" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "craigslist" ADD FOREIGN KEY ("region_id") REFERENCES "regions" ("id");

ALTER TABLE "craigslist" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");