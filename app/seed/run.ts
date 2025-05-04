import { seed } from "./seed";

seed()
  .then(() => console.log("Database seeded"))
  .catch((err) => {
    console.error("An error happened while seeding the database");
    console.error(err);
  });
