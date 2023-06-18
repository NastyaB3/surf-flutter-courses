void main() {
  while (true) {
    if (iWannaToGoToSport  && iHaveFreeTime) {
      thinkWhatIWantTodo();
      if (iHaveTooMuchEnergy) {
        chooseBoxing();
      } else if (iWouldlikeDoSomethingRelax) {
        chooseSwim();
      } else if (iWouldlikeSomethingHelpful) {
        chooseYoga();
      }
    } else {
      stayHome();
    }
  }
}

void chooseBoxing() {
  takeGloves();
  takeSportForm();
  chooseWayToGet();
  training();
}

void chooseSwim() {
  takeSwimsuit();
  takeSwimCap();
  takeSwimGlasses();
  chooseWayToGet();
  training();
}

void chooseYoga() {
  takeSportForm();
  chooseWayToGet();
  training();
}

void chooseWayToGet() {
  switch (wayToGet) {
    case farToGet:
      goByCar();
      break;
    case goodWeather:
      walk();
      break;
    case lazy:
      goBySubway();
      break;
  }

}
