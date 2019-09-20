export async function forEach(array, fn) {
  return array.reduce((chain, item) => chain.then(() => fn(item)), Promise.resolve());
}

export async function filter(array, fn) {
  const result = [];

  await forEach(array, async (item) => {
    if (await fn(item)) {
      result.push(item);
    }
  });

  return result;
}

