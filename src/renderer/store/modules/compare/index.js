function getCompare() {
  const { default: compare } = !process.env.IS_WEB ? require('./electron/compare.electron') : require('./web/compare.web');

  return compare;
}

export default getCompare();
