-- CreateTable
CREATE TABLE "test" (
    "id" SERIAL NOT NULL,
    "nazwa" VARCHAR(100) NOT NULL,
    "liczba" INTEGER NOT NULL,
    "data_utworzenia" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "test_pkey" PRIMARY KEY ("id")
);

