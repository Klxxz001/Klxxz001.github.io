(() => {
  document.documentElement.classList.add("js");

  const nav = document.getElementById("site-nav");
  const toggle = document.querySelector(".nav-toggle");
  if (!nav || !toggle) return;

  toggle.hidden = false;
  const links = [...nav.querySelectorAll('a[href^="#"]')];
  const sections = links
    .map((link) => document.querySelector(link.getAttribute("href")))
    .filter(Boolean);

  const closeMenu = () => {
    nav.classList.remove("is-open");
    toggle.setAttribute("aria-expanded", "false");
  };

  toggle.addEventListener("click", () => {
    const open = nav.classList.toggle("is-open");
    toggle.setAttribute("aria-expanded", String(open));
  });

  links.forEach((link) => link.addEventListener("click", closeMenu));
  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && nav.classList.contains("is-open")) {
      closeMenu();
      toggle.focus();
    }
  });
  document.addEventListener("click", (event) => {
    if (!event.target.closest(".masthead")) closeMenu();
  });
  const desktop = window.matchMedia("(min-width: 861px)");
  desktop.addEventListener("change", closeMenu);

  let scheduled = false;
  const updateActiveSection = () => {
    let active = sections[0]?.id;
    const headerHeight = document.querySelector(".masthead").offsetHeight;
    for (const section of sections) {
      if (section.getBoundingClientRect().top <= headerHeight + 80) {
        active = section.id;
      }
    }
    links.forEach((link) => {
      if (link.getAttribute("href") === `#${active}`) {
        link.setAttribute("aria-current", "location");
      } else {
        link.removeAttribute("aria-current");
      }
    });
    scheduled = false;
  };
  const scheduleUpdate = () => {
    if (scheduled) return;
    scheduled = true;
    window.requestAnimationFrame(updateActiveSection);
  };
  window.addEventListener("scroll", scheduleUpdate, { passive: true });
  window.addEventListener("resize", scheduleUpdate);
  window.addEventListener("hashchange", scheduleUpdate);
  document.querySelectorAll("details").forEach((details) => {
    details.addEventListener("toggle", scheduleUpdate);
  });
  updateActiveSection();
})();
