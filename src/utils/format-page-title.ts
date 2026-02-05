/**
 * @fileoverview Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Prácticas Externas
 * Blog with Astro - Utilities to format page titles
 *
 * @author Samuel Rodríguez <alu0101545714@ull.edu.es>
 * @since Thu 05/02/2026
 * @see {@link https://github.com/Samuel9645/pagina-web}
 */

/**
 * Formats a page title by combining the given title with a formatted date.
 * @param title - The main title of the page.
 * @param date - The date to be included in the title, which will be formatted as a string.
 * @returns A formatted page title in the format "Title - Date".
 */
export const formatPageTitle = (title: string, date: Date): string => {
  const formattedDate: string = date.toDateString();
  return `${title} - ${formattedDate}`;
}

