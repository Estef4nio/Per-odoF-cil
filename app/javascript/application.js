// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./packs/topics"


document.addEventListener('turbo:load', function() {
  const menuIcon = document.getElementById('menu-icon');
  const dropdownMenu = document.getElementById('dropdown-menu');
  if(!menuIcon || !dropdownMenu) return;
  
  menuIcon.addEventListener('click', function() {
    if (dropdownMenu.classList.contains('menu-show')) {
      dropdownMenu.classList.replace('menu-show', "menu-hidden");
      menuIcon.style.transform = 'rotate(0deg)'; // Voltar à posição original
    } else {
      dropdownMenu.classList.replace('menu-hidden', "menu-show");
      menuIcon.style.transform = 'rotate(180deg)'; // Rotacionar
    }
  });

  window.addEventListener('click', function(e) {
    if (!menuIcon.contains(e.target) && !dropdownMenu.contains(e.target)) {
      dropdownMenu.classList.replace('menu-show', "menu-hidden");
      menuIcon.style.transform = 'rotate(0deg)'; // Voltar à posição original ao clicar fora
    }
  });

  const notificationMenu = document.getElementById("notification-menu")
  const dropdownNotificationMenu = document.getElementById("dropdown-notification-menu")

  if(!notificationMenu || !dropdownNotificationMenu) return;

  notificationMenu.addEventListener('click', function() {
    if (dropdownNotificationMenu.classList.contains('menu-show')) {
      dropdownNotificationMenu.classList.replace('menu-show', "menu-hidden");
    } else {
      dropdownNotificationMenu.classList.replace('menu-hidden', "menu-show");
    }
  });

  window.addEventListener('click', function(e) {
    if (!notificationMenu.contains(e.target) && !dropdownNotificationMenu.contains(e.target)) {
      dropdownNotificationMenu.classList.replace('menu-show', "menu-hidden");
    }
  });
});