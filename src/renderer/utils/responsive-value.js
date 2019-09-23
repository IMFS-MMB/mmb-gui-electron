const queries = {
  xsUp: '(min-width: 0px)',
  xsDown: '(max-width: 575px)',
  xsOnly: '(max-width: 575px)',
  smUp: '(min-width: 576px)',
  smDown: '(max-width: 767px)',
  smOnly: '(min-width: 576px) and (max-width: 767px)',
  mdUp: '(min-width: 768px)',
  mdDown: '(max-width: 991px)',
  mdOnly: '(min-width: 768px) and (max-width: 991px)',
  lgUp: '(min-width: 992px)',
  lgDown: '(max-width: 1199px)',
  lgOnly: '(min-width: 992px) and (max-width: 1199px)',
  xlUp: '(min-width: 1200px)',
};

export default function responsiveValue(valueMap, defaultValue) {
  const match = Object.keys(valueMap).find(breakpoint => matchMedia(queries[breakpoint]).matches);

  return match ? valueMap[match] : defaultValue;
}
