const editor = document.getElementById('editor');
const preview = document.getElementById('preview');
const initialText = editor.textContent;
const initialMarkedText = marked.marked(initialText);
preview.innerHTML = initialMarkedText;

editor.addEventListener('input', function(e) {
    const text = e.target.value;
    const markedText = marked.marked(text);
    preview.innerHTML = markedText;
});
