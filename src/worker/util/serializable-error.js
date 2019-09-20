export default function serializableError(err) {
  const { message, stack } = err;

  return { message, stack };
}
