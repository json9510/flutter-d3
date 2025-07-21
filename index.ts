import { Elysia } from "elysia";
import { staticPlugin } from "@elysiajs/static";

const server = new Elysia().use(staticPlugin());

server.get("/example-1", () => Bun.file("public/example-1.html"));
server.get("/example-2", () => Bun.file("public/example-2.html"));

server.listen(3000);
console.log("Server running on http://localhost:3000");