---
to: <%= projectName %>/webapp/src/styles/globals.css
---

@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  /* Color System */
  --color-rose-500: hsl(351.13, 96.226%, 66.407%);
  --color-yellow-50: hsl(55.866, 100%, 95.591%);

  /* Semantic Color Tokens */
  --color-primary: var(--color-rose-500);
  --color-primary-light: hsl(351.13, 96.226%, 76.407%);
  --color-primary-dark: hsl(351.13, 96.226%, 56.407%);

  --color-secondary: var(--color-yellow-50);
  --color-secondary-light: hsl(55.866, 100%, 98%);
  --color-secondary-dark: hsl(55.866, 100%, 92%);
}

@layer base {
  /* Modern CSS Reset */
  *,
  *::before,
  *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
  }


  /* Set core body defaults */
  body {
    min-height: 100vh;
    text-rendering: optimizeSpeed;
    line-height: var(--leading-normal);
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  /* Remove list styles */
  ul[role='list'],
  ol[role='list'] {
    list-style: none;
  }

  /* Improve media defaults */
  img,
  picture,
  video,
  canvas,
  svg {
    display: block;
    max-width: 100%;
  }

  /* Remove built-in form typography styles */
  input,
  button,
  textarea,
  select {
    font: inherit;
  }

  /* Avoid text overflows */
  p,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6 {
    overflow-wrap: break-word;
  }

  /* Create a root stacking context */
  #root,
  #__next {
    isolation: isolate;
  }

  /* Remove all animations and transitions for people that prefer not to see them */
  @media (prefers-reduced-motion: reduce) {
    html:focus-within {
      scroll-behavior: auto;
    }

    *,
    *::before,
    *::after {
      animation-duration: 0.01ms !important;
      animation-iteration-count: 1 !important;
      transition-duration: 0.01ms !important;
      scroll-behavior: auto !important;
    }
  }
} 

