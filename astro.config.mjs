// @ts-check
import { defineConfig } from 'astro/config';

import pagefind from "astro-pagefind";
import rehypeDeadLinks from "./src/lib/rehype-dead-links.mjs";

export default defineConfig({
  build: {
    format: "file",
  },
  integrations: [pagefind()],
  markdown: {
    rehypePlugins: [rehypeDeadLinks],
  },
});