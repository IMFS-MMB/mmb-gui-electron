import debounce from 'lodash.debounce';

export default function resizeEvents(vue) {
  let resizing = false;

  const resizeStart = (e) => {
    resizing = true;
    vue.$emit('window:resize-start', e);
  };
  const resizeEnd = debounce((e) => {
    resizing = false;
    vue.$emit('window:resize-end', e);
  }, 400);
  const onResize = (e) => {
    if (!resizing) {
      resizeStart(e);
    }

    resizeEnd(e);
  };

  window.addEventListener('resize', onResize, false);
}
