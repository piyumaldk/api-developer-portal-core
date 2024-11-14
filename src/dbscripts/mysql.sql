-- Drop existing tables if they exist
DROP TABLE IF EXISTS "DP_API_METADATA";
DROP TABLE IF EXISTS "DP_API_CONTENT";
DROP TABLE IF EXISTS "DP_API_IMAGEDATA";
DROP TABLE IF EXISTS "DP_API_SUBSCRIPTION_POLICY";
DROP TABLE IF EXISTS "DP_ORGANIZATION";
DROP TABLE IF EXISTS "DP_ORGANIZATION_ASSETS";


CREATE TABLE "DP_ORGANIZATION" (
	"ORG_ID" VARCHAR(256) NOT NULL,
	"ORG_NAME" VARCHAR(256) NOT NULL,
	"BUSINESS_OWNER" VARCHAR(256) NOT NULL,
	"BUSINESS_OWNER_CONTACT" VARCHAR(256) NOT NULL,
	"BUSINESS_OWNER_EMAIL" VARCHAR(256) NOT NULL,
	UNIQUE ("ORG_NAME"),
	PRIMARY KEY("ORG_ID")
);

CREATE TABLE "DP_ORGANIZATION_ASSETS" (
	"ASSERT_ID" VARCHAR(256) NOT NULL,
	"FILE_NAME" VARCHAR(256) NOT NULL,
	"FILE_CONTENT" BYTEA NOT NULL,
	"FILE_TYPE" VARCHAR(256) NOT NULL,
	"FILE_PATH" VARCHAR(1000) NOT NULL,
	"ORG_ID" VARCHAR(256) NOT NULL,
	FOREIGN KEY("ORG_ID") REFERENCES "DP_ORGANIZATION"("ORG_ID") ON DELETE CASCADE,
	UNIQUE ("FILE_NAME", "FILE_TYPE", "FILE_PATH", "ORG_ID"),
	PRIMARY KEY("ASSERT_ID")
);

-- Create DP_API_METADATA table
CREATE TABLE IF NOT EXISTS DP_API_METADATA (
    "API_ID" character varying(191) NOT NULL,
    "REFERENCE_ID" character varying(191),
    "ORG_ID" character varying(191) NOT NULL,
    "API_NAME" character varying(191) UNIQUE NOT NULL,
    "API_DESCRIPTION" character varying(191) NOT NULL,
    "API_VERSION" character varying(191) NOT NULL,
    "API_TYPE" character varying(191) NOT NULL,
    "VISIBILITY" character varying(191) NOT NULL,
    "VISIBLE_GROUPS" character varying(191),
    "TECHNICAL_OWNER" character varying(191),
    "BUSINESS_OWNER" character varying(191),
    "TECHNICAL_OWNER_EMAIL" character varying(191),
    "BUSINESS_OWNER_EMAIL" character varying(191),
    "PRODUCTION_URL" character varying(191),
    "SANDBOX_URL" character varying(191),
    "METADATA_SEARCH" JSON,
    PRIMARY KEY ("API_ID"),
    FOREIGN KEY ("ORG_ID") REFERENCES "Organization" ("ORG_ID") ON DELETE CASCADE
);

-- Create DP_API_CONTENT table
CREATE TABLE IF NOT EXISTS DP_API_CONTENT (
    "API_FILE" BYTEA,
    "FILE_NAME" character varying(191) NOT NULL,
    "API_ID" character varying(191) NOT NULL,
    PRIMARY KEY ("API_ID", "FILE_NAME"),
    FOREIGN KEY ("API_ID") REFERENCES DP_API_METADATA("API_ID") ON DELETE CASCADE
);

-- Create DP_API_IMAGEDATA table
CREATE TABLE IF NOT EXISTS DP_API_IMAGEDATA (
    "IMAGE_NAME" character varying(191) NOT NULL,
    "IMAGE_TAG" character varying(191) NOT NULL,
    "API_ID" character varying(191) NOT NULL,
    PRIMARY KEY ("API_ID", "IMAGE_NAME", "IMAGE_TAG"),
    FOREIGN KEY ("API_ID") REFERENCES DP_API_METADATA("API_ID") ON DELETE CASCADE
);

-- Create DP_API_SUBSCRIPTION_POLICY table
CREATE TABLE IF NOT EXISTS DP_API_SUBSCRIPTION_POLICY (
    "POLICY_NAME" character varying(191) NOT NULL,
    "API_ID" character varying(191) NOT NULL,
    PRIMARY KEY ("API_ID", "POLICY_NAME"),
    FOREIGN KEY ("API_ID") REFERENCES DP_API_METADATA("API_ID") ON DELETE CASCADE
);
