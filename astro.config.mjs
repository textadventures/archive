// @ts-check
import { defineConfig } from 'astro/config';

import pagefind from "astro-pagefind";

export default defineConfig({
  build: {
    format: "file",
  },
  integrations: [pagefind()],
});