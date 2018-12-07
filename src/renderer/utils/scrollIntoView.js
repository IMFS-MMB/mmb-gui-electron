import logger from './logger';

export default function scrollIntoView(idOrElement) {
  const element = typeof idOrElement === 'string' ? document.getElementById(idOrElement) : idOrElement;

  try {
    element.scrollIntoView({
      behavior: 'smooth',
      block: 'start',
    });
  } catch (e) {
    logger.debug(e);
    return false;
  }

  return true;
}
