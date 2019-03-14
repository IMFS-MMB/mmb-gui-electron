function exitSuccess(message) {
  if (message) console.log(message);

  process.exit(0);
}

function exitError(message) {
  if (message) console.error(message);

  process.exit(1);
}

module.exports = {
  exitError,
  exitSuccess,
};
