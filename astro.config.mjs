// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  // site: 'https://Samuel9645.github.io',
  // base: '/pagina-web/',

  vite: {
    plugins: [tailwindcss()],
  },
});