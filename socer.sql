DROP DATABASE IF EXISTS  socer_db;

CREATE DATABASE socer_db;

\c socer_db;

CREATE TABLE "teams" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "rank" int,
  "player_id" int
);

CREATE TABLE "goals_scored" (
  "id" int PRIMARY KEY,
  "player_id" int,
  "goals_scored" int,
  "match_id" int
);

CREATE TABLE "players" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "referee" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "match" (
  "id" int PRIMARY KEY,
  "home_team_id" int,
  "away_team_id" int,
  "referee_id" int,
  "location" varchar,
  "date" date,
  "season_id" int,
  "final_score" varchar
);

CREATE TABLE "season" (
  "id" int PRIMARY KEY,
  "season_start" date,
  "season_end" date
);

ALTER TABLE "teams" ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");

ALTER TABLE "goals_scored" ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");

ALTER TABLE "goals_scored" ADD FOREIGN KEY ("match_id") REFERENCES "match" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("home_team_id") REFERENCES "teams" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("away_team_id") REFERENCES "teams" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("referee_id") REFERENCES "referee" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("season_id") REFERENCES "season" ("id");