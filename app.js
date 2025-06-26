(async function() {
  try {
    const response = await fetch('https://api.open-notify.org/astros.json');
    if (!response.ok) throw new Error('Network response was not ok');
    const data = await response.json();
    document.getElementById('count').textContent = data.number;
  } catch (err) {
    console.error('Failed to fetch astronaut count', err);
    document.getElementById('count').textContent = '?';
  }
})();
