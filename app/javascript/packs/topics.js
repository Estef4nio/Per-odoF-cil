function isDisciplinasPage() {
  const path = window.location.pathname;
  return path === '/disciplinas/new' || path.startsWith('/disciplinas/') && path.endsWith('/edit');
}

function initializeTopics() {
  if (isDisciplinasPage()) {
    const topicsContainer = document.getElementById('topics-container');
    const addTopicButton = document.getElementById('add-topic');
    
    if (addTopicButton) {
      addTopicButton.addEventListener('click', () => {
        const index = topicsContainer.children.length;
        const newField = document.createElement('div');
        newField.className = 'topic-field';
        newField.innerHTML = `
          <input type="text" name="disciplina[topics][]" placeholder="Add a topic">
          <button type="button" class="remove-topic" data-index="${index}">Remove</button>
        `;
        topicsContainer.appendChild(newField);
      });
    }
    
    topicsContainer.addEventListener('click', (event) => {
      if (event.target.classList.contains('remove-topic')) event.target.parentElement.remove();
    });
  }
}



document.addEventListener('turbo:load', initializeTopics);