import { seed } from "./seed";

export async function GET() {
  try {
    const result = await seed();

    return Response.json({ message: "Database seeded successfully" });
  } catch (error) {
    return Response.json({ error }, { status: 500 });
  }
}
