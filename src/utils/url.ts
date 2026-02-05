/**
 * @fileoverview Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Prácticas Externas
 * Blog with Astro - URL utilities
 *
 * @author Samuel Rodríguez <alu0101545714@ull.edu.es>
 * @since Thu 05/02/2026
 * @see {@link https://github.com/Samuel9645/pagina-web}
 */

/**
 * Adds the base deployed URL prefix to a given URL path.
 * @param url - The URL path to which the base URL will be added.
 * @returns The full URL with the base URL prepended.
 */
export const addBaseUrl = (url: string): string => {
  const baseUrl: string = import.meta.env.BASE_URL || '/';
  const normalizedUrl: string = url.startsWith('/') ? url.substring(1) : url;
  return `${baseUrl}${normalizedUrl}`;
}

