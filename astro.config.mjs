// @ts-check
import { defineConfig } from 'astro/config';
import { unified } from '@astrojs/markdown-remark';

import pagefind from "astro-pagefind";
import rehypeDeadLinks from "./src/lib/rehype-dead-links.mjs";

export default defineConfig({
  build: {
    format: "file",
  },
  integrations: [pagefind()],
  markdown: {
    processor: unified({
      rehypePlugins: [rehypeDeadLinks],
    }),
  },
});