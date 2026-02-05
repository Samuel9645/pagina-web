import { defineCollection, z, getCollection } from "astro:content";
import type { CollectionEntry } from 'astro:content';
import { glob } from "astro/loaders";

const blog = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./posts" }),
  schema: z.object({
    author: z.string(),
    date: z.string(),
    title: z.string(),
    featured: z.boolean(),
  })
});


export const collections = {
  blog
};

export type BlogEntry = CollectionEntry<'blog'>;
export const getAllPosts: () => Promise<BlogEntry[]> = async () => {
  return await getCollection('blog');
}