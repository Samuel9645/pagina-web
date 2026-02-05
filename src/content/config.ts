import { defineCollection, z, getCollection } from "astro:content";
import type { CollectionEntry } from 'astro:content';
import { glob } from "astro/loaders";

/**
 * Converts a date string in "DD/MM/YYYY" format to a Date object.
 * @param dateString - The date string to convert, expected in the format "DD/MM/YYYY".
 * @returns Date object representing the given date string.
 * @throws Will throw an error if the date string is not in the expected format.
 */
const stringToDate = (dateString: string): Date => {
  const [day, month, year]: number[] = dateString.split('/').map(Number);
  if (day === undefined || month === undefined || year === undefined) {
    throw new Error(
      `Invalid date format: ${dateString}. Expected format is "DD/MM/YYYY".`
    );
  }
  return new Date(year, month - 1, day);
}

const blog = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./posts" }),
  schema: z.object({
    date: z.string().transform(stringToDate),
    title: z.string(),
  })
});


export const collections = {
  blog
};

export type BlogEntry = CollectionEntry<'blog'>;
export const getAllPosts: () => Promise<BlogEntry[]> = async () => {
  return await getCollection('blog');
}