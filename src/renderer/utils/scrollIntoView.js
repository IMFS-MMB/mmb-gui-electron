import logger from './logger';

export default function scrollIntoView(idOrElement) {
  const element = typeof idOrElement === 'string' ? document.getElementById(idOrElement) : idOrElement;

  // The comparison section may not be fully rendered yet,
  // so defer scrolling until the next tick.

  try {
    element.scrollIntoView({
      behavior: 'smooth',
      block: 'start',
    });
  } catch (e) {
    logger.debug(e);
  }
}
