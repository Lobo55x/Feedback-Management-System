// Utility functions and types for @feedbackly/utils

// Example: A simple helper to check if a value is defined
export function isDefined<T>(value: T | undefined | null): value is T {
  return value !== undefined && value !== null;
}

// Example: A type for a generic key-value map
export type Dictionary<T = any> = {
  [key: string]: T;
};