"use strict";
(function() {
  const photoSwitches = document.querySelectorAll('.aboutme-photo-switch');
  let activeSwitch = 0;
  const profileImgs = document.querySelectorAll('.aboutme-photo-img');
  let timeout;

  /**
   * manages timout for switching to next profile pic
   */
  function scheduleNextChange() {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      switchProfilePic((activeSwitch + 1) % 3);
    }, 5000);
  }

  /**
   * switches to selected profile pic and schedules next change event
   * 
   * @param index index of profile pic to show
   */
  function switchProfilePic(index) {
    photoSwitches[activeSwitch].classList.remove('active');
    profileImgs[activeSwitch].classList.remove('active');
    photoSwitches[index].classList.add('active');
    profileImgs[index].classList.add('active');
    activeSwitch = index;
    scheduleNextChange();
  }

  /**
   * sets event listeners on switches to let user choose a profile pic
   */
  photoSwitches.forEach((_switch, index) => {
    _switch.addEventListener('click', () => {
      switchProfilePic(index);
    });
  });
  
  scheduleNextChange();
})();