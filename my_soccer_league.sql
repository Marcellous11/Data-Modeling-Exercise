-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lAnXhv
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "teams" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    "goals" TEXT   NOT NULL,
    "team_id" TEXT   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches" (
    "id" int   NOT NULL,
    "data" TEXT   NOT NULL,
    "location" TEXT   NOT NULL,
    "date" date   NOT NULL,
    "start_time" time   NOT NULL,
    "home_team_id" int   NOT NULL,
    "away_team_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    "reff_id" int   NOT NULL,
    CONSTRAINT "pk_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "season" (
    "id" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "reffs" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_reffs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "goals" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "results" (
    "id" int   NOT NULL,
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result" TEXT   NOT NULL,
    CONSTRAINT "pk_results" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_season_id" FOREIGN KEY("season_id")
REFERENCES "season" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_reff_id" FOREIGN KEY("reff_id")
REFERENCES "reffs" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

