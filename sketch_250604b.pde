import processing.sound.*;

SoundFile music1;
SoundFile pop;
SoundFile coin;
SoundFile plantingSound;
SoundFile click;
SoundFile frogLandMusic;
SoundFile eggLandMusic;
SoundFile seedMenuMusic;
SoundFile startSound;
SoundFile preGameSound;

PImage froggy1;
PImage startButtonImage;
PImage startBackgroundImage;
PImage gameTextImage;
PImage openScreenImage;
PImage secondBackgroundImage;
PImage storeFrogImage;
PImage storeSeedImage;
PImage seedMenuImage;
PImage frogLandImage;
PImage tenCostImage;
PImage twentyFiveCostImage;
PImage backButtonImage;
PImage carrotSeedBag;
PImage sprout;
PImage grownCarrot;
PImage grownMushroom;
PImage mushroomSeedBag;
PImage currencyCoin;
PImage grownTomato;
PImage tomatoSeedBag;
PImage fiftyCostImage;
PImage strawberrySeedBag;
PImage grownStrawberry;
PImage oneHundredCostImage;
PImage grownDragonfruit;
PImage dragonfruitSeedBag;
PImage oneThousandCostImage;
PImage door;
PImage eggBackground;

// Egg Images
PImage commonEgg;
PImage rareEgg;
PImage specialEgg; // New: Special Egg Image
PImage legendEgg; // New: Legend Egg Image
PImage prismaticEgg; // New: Prismatic Egg Image

// Frog Images (keeping original declarations for clarity)
PImage commonFrog1;
PImage commonFrog2;
PImage commonFrog3;
PImage rareFrog1;
PImage rareFrog2;
PImage rareFrog3;
PImage primFrog1;
PImage primFrog2;
PImage primFrog3;
PImage legendFrog1;
PImage legendFrog2;
PImage legendFrog3;
PImage specFrog1;
PImage specFrog2;
PImage specFrog3;

PImage imgToDraw = froggy1;
PImage backpackIcon;
PImage backpackScreenImage;

float frogPositionX = 200;
float frogPositionY = 200;

int startButtonPositionX = 300;
int startButtonPositionY = 400;
int startButtonWidth = 200;
int startButtonHeight = 100;

int characterCurrency = 100000000;

boolean isSpinning = false;
int spinStartTime = 0;
float spinAngle = 0;

boolean gameStarted = false;
boolean inFrogLand = false;
boolean inSeedMenu = false;
boolean showShopOptions = false;
float worldPositionX = 0;

boolean carrotPlanted = false;
int carrotPlantTime = 0;
boolean instructionChanged = false;

boolean tomatoPlanted = false;
int tomatoPlantTime = 0;

boolean mushroomPlanted = false;
boolean dragonfruitPlanted = false;
int mushroomPlantTime = 0;

boolean commonEggPlanted = false;
int commonEggPlantTime = 0;

boolean rareEggPlanted = false;
int rareEggPlantTime = 0;

boolean specialEggPlanted = false; // New: Special egg planted state
int specialEggPlantTime = 0;

boolean legendEggPlanted = false; // New: Legend egg planted state
int legendEggPlantTime = 0;

boolean prismaticEggPlanted = false; // New: Prismatic egg planted state
int prismaticEggPlantTime = 0;


boolean strawberryPlanted = false;
int strawberryPlantTime = 0;

int storeFrogPositionX = 650;
int storeFrogPositionY = 10;
int storeFrogWidth = 100;
int storeFrogHeight = 100;

int storeSeedPositionX = storeFrogPositionX - 110;
int storeSeedPositionY = storeFrogPositionY;
int storeSeedWidth = storeFrogWidth + 2;
int storeSeedHeight = storeFrogHeight + 10;

int backpackIconX = storeSeedPositionX - 110;
int backpackIconY = storeFrogPositionY+20;
int backpackIconWidth = 50;
int backpackIconHeight = 50;

int buyTextX;
int buyTextY;
int sellTextX;
int sellTextY;
int textOptionWidth = 50;
int textOptionHeight = 20;

int doorCounter = 0;

float startFrogPositionX = 350;
float startFrogPositionY = 300;
float startFrogSpeed = 2;
boolean startFrogGoingUp = true;

boolean placingCarrotSeed = false;
boolean placingMushroomSeed = false;
boolean placingTomatoSeed = false;
boolean placingStrawberrySeed = false;
boolean placingDragonfruitSeed = false;

boolean placingCommonEgg = false;
boolean placingRareEgg = false;
boolean placingSpecialEgg = false; // New: For special egg
boolean placingLegendEgg = false; // New: For legend egg
boolean placingPrismaticEgg = false; // New: For prismatic egg

boolean hasBoughtCarrotSeed = false;
boolean hasBoughtMushroomSeed = false;
boolean hasBoughtTomatoSeed = false;
boolean hasBoughtStrawberrySeed = false;
boolean hasBoughtDragonfruitSeed = false;
boolean hasBoughtCommonEgg = false;
boolean hasBoughtRareEgg = false;
boolean hasBoughtSpecialEgg = false;
boolean hasBoughtLegendEgg = false;
boolean hasBoughtPrismaticEgg = false;

boolean hasSoldFirstItem = false;

boolean inEggLand = false;
boolean inBackpack = false;

boolean showSellNotification = false;
boolean showDoorNotification = false;
int sellNotificationStartTime = 0;
int doorNotificationStartTime = 0;
int amountSoldFor = 0;

int selectedInventoryIndex = -1;



class PlantedCarrot {
  PVector position;
  int plantedTime;

  PlantedCarrot(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
  }
}

class PlantedMushroom {
  PVector position;
  int plantedTime;

  PlantedMushroom(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
  }
}

class PlantedTomato {
  PVector position;
  int plantedTime;

  PlantedTomato(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
  }
}

class PlantedStrawberry {
  PVector position;
  int plantedTime;

  PlantedStrawberry(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
  }
}

class PlantedDragonfruit {
  PVector position;
  int plantedTime;

  PlantedDragonfruit(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
  }
}

class PlantedCommonEgg {
  PVector position;
  int plantedTime;
  PImage hatchedFrog;

  PlantedCommonEgg(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
    int rand = (int) random(3);
    if (rand == 0) {
      hatchedFrog = commonFrog1;
    } else if (rand == 1) {
      hatchedFrog = commonFrog2;
    } else {
      hatchedFrog = commonFrog3;
    }
  }
}

class PlantedRareEgg {
  PVector position;
  int plantedTime;
  PImage hatchedFrog;

  PlantedRareEgg(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
    int rand = (int) random(3);
    if (rand == 0) {
      hatchedFrog = rareFrog1;
    } else if (rand == 1) {
      hatchedFrog = rareFrog2;
    } else {
      hatchedFrog = rareFrog3;
    }
  }
}

class PlantedSpecialEgg {
  PVector position;
  int plantedTime;
  PImage hatchedFrog;

  PlantedSpecialEgg(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
    int rand = (int) random(3);
    if (rand == 0) {
      hatchedFrog = specFrog1;
    } else if (rand == 1) {
      hatchedFrog = specFrog2;
    } else {
      hatchedFrog = specFrog3;
    }
  }
}

class PlantedLegendEgg {
  PVector position;
  int plantedTime;
  PImage hatchedFrog;

  PlantedLegendEgg(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
    int rand = (int) random(3);
    if (rand == 0) {
      hatchedFrog = legendFrog1;
    } else if (rand == 1) {
      hatchedFrog = legendFrog2;
    } else {
      hatchedFrog = legendFrog3;
    }
  }
}

class PlantedPrismaticEgg {
  PVector position;
  int plantedTime;
  PImage hatchedFrog;

  PlantedPrismaticEgg(PVector position, int plantedTime) {
    this.position = position;
    this.plantedTime = plantedTime;
    int rand = (int) random(3);
    if (rand == 0) {
      hatchedFrog = primFrog1;
    } else if (rand == 1) {
      hatchedFrog = primFrog2;
    } else {
      hatchedFrog = primFrog3;
    }
  }
}


ArrayList<PlantedCarrot> plantedCarrots = new ArrayList<PlantedCarrot>();
ArrayList<PlantedMushroom> plantedMushrooms = new ArrayList<PlantedMushroom>();
ArrayList<PlantedTomato> plantedTomatoes = new ArrayList<PlantedTomato>();
ArrayList<PlantedStrawberry> plantedStrawberries = new ArrayList<PlantedStrawberry>();
ArrayList<PlantedDragonfruit> plantedDragonfruits = new ArrayList<PlantedDragonfruit>();
ArrayList<PlantedCommonEgg> plantedCommonEggs = new ArrayList<PlantedCommonEgg>();
ArrayList<PlantedRareEgg> plantedRareEggs = new ArrayList<PlantedRareEgg>();
ArrayList<PlantedSpecialEgg> plantedSpecialEggs = new ArrayList<PlantedSpecialEgg>();
ArrayList<PlantedLegendEgg> plantedLegendEggs = new ArrayList<PlantedLegendEgg>();
ArrayList<PlantedPrismaticEgg> plantedPrismaticEggs = new ArrayList<PlantedPrismaticEgg>();


String[] instructions = {
  "welcome to frog farm, press → for next instructions",
  "move around with wasd",
  "buy seeds from the shop, then plant and sell them for money",
  "start with buying and planting a carrot seed from the shop"
};
int currentInstructionIndex = 0;

class InventoryItem {
  String name;
  PImage image;
  int quantity;
  int sellPrice;

  InventoryItem(String name, PImage image, int quantity, int sellPrice) {
    this.name = name;
    this.image = image;
    this.quantity = quantity;
    this.sellPrice = sellPrice;
  }
}

InventoryItem[] inventory = new InventoryItem[8];

ArrayList<PImage> ownedFrogs = new ArrayList<PImage>(); // New: List to store owned frog images

void setup() {
  size(800, 800);
  froggy1 = loadImage("froggy1.png");
  froggy1.resize(60, 60);

  ownedFrogs.add(loadImage("froggy1.png"));
  ownedFrogs.get(0).resize(60, 60);

  commonFrog1 = loadImage("commonFrog1.png"); commonFrog1.resize(45,45);
  commonFrog2 = loadImage("commonFrog2.png"); commonFrog2.resize(45,45);
  commonFrog3 = loadImage("commonFrog3.png"); commonFrog3.resize(45,45);
  rareFrog1 = loadImage("rareFrog1.png"); rareFrog1.resize(45,45);
  rareFrog2 = loadImage("rareFrog2.png"); rareFrog2.resize(45,45);
  rareFrog3 = loadImage("rareFrog3.png"); rareFrog3.resize(45,45);
  specFrog1 = loadImage("specFrog1.png"); specFrog1.resize(45,45);
  specFrog2 = loadImage("specFrog2.png"); specFrog2.resize(45,45);
  specFrog3 = loadImage("specFrog3.png"); specFrog3.resize(45,45);
  legendFrog1 = loadImage("legendFrog1.png"); legendFrog1.resize(45,45);
  legendFrog2 = loadImage("legendFrog2.png"); legendFrog2.resize(45,45);
  legendFrog3 = loadImage("legendFrog3.png"); legendFrog3.resize(45,45);
  primFrog1 = loadImage("primFrog1.png"); primFrog1.resize(45,45);
  primFrog2 = loadImage("primFrog2.png"); primFrog2.resize(45,45);
  primFrog3 = loadImage("primFrog3.png"); primFrog3.resize(45,45);


  backpackScreenImage = loadImage("backpackScreenImage.png");
  backpackIcon = loadImage("backpackIcon.png");
  backpackIcon.resize(40,40);
 


  music1 = new SoundFile(this, "music1.mp3");
  pop = new SoundFile(this, "pop.mp3");
  frogLandMusic = new SoundFile(this, "frogLandMusic.mp3");
  eggLandMusic = new SoundFile(this, "eggLandMusic.mp3");
  seedMenuMusic = new SoundFile(this, "seedMenuMusic.mp3");
  startSound = new SoundFile(this, "startSound.mp3");
  coin = new SoundFile(this, "coin.mp3");
  plantingSound = new SoundFile(this, "plantingSound.mp3");
  click = new SoundFile(this, "click.mp3");
  preGameSound = new SoundFile(this, "preGame.mp3");
  preGameSound.loop();

  startBackgroundImage = loadImage("startScreenBackground.jpg");
  secondBackgroundImage = loadImage("secondBackground.png");
  eggBackground = loadImage("eggBackground.png");

  startButtonImage = loadImage("startingButton.png");
  startButtonImage.resize(startButtonWidth * 2, startButtonHeight * 2);

  gameTextImage = loadImage("gameText.png");
  gameTextImage.resize(700, 100);

  currencyCoin = loadImage("currencyCoin.png");
  currencyCoin.resize(50,50);

  storeSeedImage = loadImage("storeSeed.png");
  storeSeedImage.resize(storeSeedWidth, storeSeedHeight);

  openScreenImage = loadImage("openImage.png");

  storeFrogImage = loadImage("storeFrog.png");
  storeFrogImage.resize(storeFrogWidth, storeFrogHeight);

  backpackIcon = loadImage("backpackIcon.png");
  backpackIcon.resize(75,75);

  seedMenuImage = loadImage("seedMenu.png");
  frogLandImage = loadImage("frogLand.png");

  backButtonImage = loadImage("backButton.png");
  backButtonImage.resize(100, 50);

  tenCostImage = loadImage("tenCost.png");
  tenCostImage.resize(30,30);
  twentyFiveCostImage = loadImage("twentyFiveCostImage.png");
  twentyFiveCostImage.resize(21,21);
  fiftyCostImage = loadImage("fiftyCostImage.png");
  fiftyCostImage.resize(20,20);
  oneHundredCostImage = loadImage("oneHundredCostImage.png");
  oneHundredCostImage.resize(21,21);
  oneThousandCostImage = loadImage("oneThousandCostImage.png");
  oneThousandCostImage.resize(25,25);

  carrotSeedBag = loadImage("carrotSeedBag.png");
  carrotSeedBag.resize(50, 50);

  mushroomSeedBag = loadImage("mushroomSeedBag.png");
  mushroomSeedBag.resize(50, 50);

  tomatoSeedBag = loadImage("tomatoSeedBag.png");
  tomatoSeedBag.resize(50,50);

  strawberrySeedBag = loadImage("strawberrySeedBag.png");
  strawberrySeedBag.resize(50,50);

  dragonfruitSeedBag = loadImage("dragonfruitSeedBag.png");
  dragonfruitSeedBag.resize(50,50);

  sprout = loadImage("sprout.png");
  sprout.resize(30, 30);

  grownCarrot = loadImage("grownCarrot.png");
  grownCarrot.resize(30, 30);

  grownMushroom = loadImage("mushroom.png");
  grownMushroom.resize(35, 35);

  grownTomato = loadImage("tomato.png");
  grownTomato.resize(30,30);

  grownStrawberry = loadImage("strawberry.png");
  grownStrawberry.resize(27,27);

  grownDragonfruit = loadImage("dragonfruit.png");
  grownDragonfruit.resize(40,40);

  commonEgg = loadImage("commonEgg.png");
  commonEgg.resize(45,45);

  rareEgg = loadImage("rareEgg.png");
  rareEgg.resize(45, 45);

  specialEgg = loadImage("specEgg.png");
  specialEgg.resize(45, 45);

  legendEgg = loadImage("legendEgg.png");
  legendEgg.resize(45, 45);

  prismaticEgg = loadImage("primEgg.png");
  prismaticEgg.resize(45, 45);


  door = loadImage("door.png");
  door.resize(100,100);

  buyTextX = storeSeedPositionX - 60;
  buyTextY = storeSeedPositionY + 50;
  sellTextX = storeSeedPositionX - 60;
  sellTextY = storeSeedPositionY + 80;
}

void draw() {
  if (!gameStarted) {
    drawStartScreen();
  } else if (inFrogLand) {
    drawFrogLand();
  } else if (inSeedMenu) {
    drawSeedMenu();
  } else if (inEggLand) {
    drawEggLand();
  } else if (inBackpack) {
    drawBackpack();
  } else {
    drawGame();

    if (showSellNotification) {
      drawSellNotification();
    } else if (showShopOptions) {
      drawShopOptions();
    } else {
      if (!carrotPlanted && !hasSoldFirstItem) {
        drawToggleableInstructions();
      } else if (hasBoughtCarrotSeed && !carrotPlanted) {
        drawSingleInstruction("plant the carrot seed");
      } else if (carrotPlanted && !hasSoldFirstItem) {
        drawSingleInstruction("now wait 10 seconds and then harvest/sell your carrot");
      }
    }
    drawInventory();
  }
}

void drawSingleInstruction(String instructionText) {
  fill(0, 0, 0, 180);
  rect(0, 0, width, 50);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text(instructionText, width / 2, 25);
}

void drawToggleableInstructions() {
  fill(0, 0, 0, 180);
  rect(0, 0, width, 50);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text(instructions[currentInstructionIndex], width / 2, 25);
}

void drawStartScreen() {
  image(startBackgroundImage, 0, 0, width, height);
  image(startButtonImage, startButtonPositionX, startButtonPositionY);
  image(gameTextImage, 60, 200);

  PImage biggerFrog = froggy1.copy();
  biggerFrog.resize(240, 240);
  image(biggerFrog, startFrogPositionX - 250, startFrogPositionY + 105);

  if (startFrogGoingUp) {
    startFrogPositionY -= startFrogSpeed * 4;
    if (startFrogPositionY <= 230) startFrogGoingUp = false;
  } else {
    startFrogPositionY += startFrogSpeed * 4;
    if (startFrogPositionY >= 300) startFrogGoingUp = true;
  }
}

void drawGame() {
  image(openScreenImage, -worldPositionX, 0, 800, 800);
  image(secondBackgroundImage, 800 - worldPositionX, 0, 800, 800);

  if (!inFrogLand && !inSeedMenu && !inBackpack && !inEggLand) {
    if (isSpinning) {
      int elapsed = millis() - spinStartTime;
      if (elapsed < 5000) {
        float centerX = frogPositionX + froggy1.width / 2;
        float centerY = frogPositionY + froggy1.height / 2;
        spinAngle += radians(100);

        pushMatrix();
        translate(centerX, centerY);
        rotate(spinAngle);
        imageMode(CENTER);
        image(froggy1, 0, 0);
        imageMode(CORNER);
        popMatrix();
      } else {
        isSpinning = false;
        spinAngle = 0;
        image(froggy1, frogPositionX, frogPositionY);
      }
    } else {
      image(froggy1, frogPositionX, frogPositionY);
    }
  }

  if (worldPositionX >= 400) {
    image(storeFrogImage, storeFrogPositionX, storeFrogPositionY);
    image(storeSeedImage, storeSeedPositionX, storeSeedPositionY);
    image(backpackIcon, backpackIconX, backpackIconY);
  }

  drawCurrency();

  // Drawing planted items
  for (PlantedCarrot carrot : plantedCarrots) {
    PImage imgToDraw = millis() - carrot.plantedTime >= 10000 ? grownCarrot : sprout;
    image(imgToDraw, carrot.position.x - worldPositionX + 30, carrot.position.y);
  }
  for (PlantedMushroom mushroom : plantedMushrooms) {
    PImage imgToDraw = millis() - mushroom.plantedTime >= 1000 ? grownMushroom : sprout;
    image(imgToDraw, mushroom.position.x - worldPositionX + 30, mushroom.position.y);
  }
  for (PlantedTomato tomato : plantedTomatoes) {
    PImage imgToDraw = millis() - tomato.plantedTime >= 1000 ? grownTomato : sprout;
    image(imgToDraw, tomato.position.x - worldPositionX + 30, tomato.position.y);
  }
  for (PlantedStrawberry strawberry : plantedStrawberries) {
    PImage imgToDraw = millis() - strawberry.plantedTime >= 1000 ? grownStrawberry : sprout;
    image(imgToDraw, strawberry.position.x - worldPositionX + 30, strawberry.position.y);
  }
  for (PlantedDragonfruit dragonfruit : plantedDragonfruits) {
    PImage imgToDraw = millis() - dragonfruit.plantedTime >= 1000 ? grownDragonfruit : sprout;
    image(imgToDraw, dragonfruit.position.x - worldPositionX + 30, dragonfruit.position.y);
  }

  for (PlantedCommonEgg commonegg : plantedCommonEggs) {
    PImage imgToDraw = millis() - commonegg.plantedTime >= 1000 ? commonegg.hatchedFrog : commonEgg;
    image(imgToDraw, commonegg.position.x - worldPositionX + 30, commonegg.position.y);
    if (millis() - commonegg.plantedTime >= 1000 && !ownedFrogs.contains(commonegg.hatchedFrog)) {
      ownedFrogs.add(commonegg.hatchedFrog);
    }
  }
  for (PlantedRareEgg rareegg : plantedRareEggs) {
    PImage imgToDraw = millis() - rareegg.plantedTime >= 1000 ? rareegg.hatchedFrog : rareEgg;
    image(imgToDraw, rareegg.position.x - worldPositionX + 30, rareegg.position.y);
    if (millis() - rareegg.plantedTime >= 1000 && !ownedFrogs.contains(rareegg.hatchedFrog)) {
      ownedFrogs.add(rareegg.hatchedFrog);
    }
  }
  for (PlantedSpecialEgg specegg : plantedSpecialEggs) {
    PImage imgToDraw = millis() - specegg.plantedTime >= 1000 ? specegg.hatchedFrog : specialEgg;
    image(imgToDraw, specegg.position.x - worldPositionX + 30, specegg.position.y);
    if (millis() - specegg.plantedTime >= 1000 && !ownedFrogs.contains(specegg.hatchedFrog)) {
      ownedFrogs.add(specegg.hatchedFrog);
    }
  }
  for (PlantedLegendEgg legendegg : plantedLegendEggs) {
    PImage imgToDraw = millis() - legendegg.plantedTime >= 1000 ? legendegg.hatchedFrog : legendEgg;
    image(imgToDraw, legendegg.position.x - worldPositionX + 30, legendegg.position.y);
    if (millis() - legendegg.plantedTime >= 1000 && !ownedFrogs.contains(legendegg.hatchedFrog)) {
      ownedFrogs.add(legendegg.hatchedFrog);
    }
  }
  for (PlantedPrismaticEgg primegg : plantedPrismaticEggs) {
    PImage imgToDraw = millis() - primegg.plantedTime >= 1000 ? primegg.hatchedFrog : prismaticEgg;
    image(imgToDraw, primegg.position.x - worldPositionX + 30, primegg.position.y);
    if (millis() - primegg.plantedTime >= 1000 && !ownedFrogs.contains(primegg.hatchedFrog)) {
      ownedFrogs.add(primegg.hatchedFrog);
    }
  }
}

void drawShopOptions() {
  fill(0, 0, 0, 150);
  noStroke();

  rect(buyTextX - 5, buyTextY - 5, textOptionWidth + 10, textOptionHeight + 10, 5);
  rect(sellTextX - 5, sellTextY - 5, textOptionWidth + 10, textOptionHeight + 10, 5);

  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);

  text("BUY", buyTextX, buyTextY);
  text("SELL", sellTextX, sellTextY);
}

void drawFrogLand() {
  image(frogLandImage, 0, 0, width, height);
  image(backButtonImage, 650, 650);
  image(door, 500, 200, 150, 200);
  if(doorCounter <= 1) {
    drawDoorNotification();
  }
  drawCurrency();
}

void drawEggLand() {
  image(eggBackground, 0, 0, width, height);
  image(backButtonImage, 650, 650);


  drawCurrency();
}

void drawBackpack() {
  image(backpackScreenImage, 0, 0, width, height);
  image(backButtonImage, 650, 650);
  drawCurrency();

  int startX = 50;
  int startY = 100;
  int frogSize = 80;
  int padding = 20;
  int frogsPerRow = 5;

  textSize(32);
  fill(0);
  textAlign(CENTER, TOP);
  text("Your Frog Collection", width / 2, 30);

  for (int i = 0; i < ownedFrogs.size(); i++) {
    PImage currentFrog = ownedFrogs.get(i);
    int row = i / frogsPerRow;
    int col = i % frogsPerRow;
    int x = startX + col * (frogSize + padding);
    int y = startY + row * (frogSize + padding);

    fill(200, 200, 200, 150);
    rect(x, y, frogSize, frogSize, 10);
    image(currentFrog, x + (frogSize - currentFrog.width) / 2, y + (frogSize - currentFrog.height) / 2);
  }
}

void drawSeedMenu() {
  image(seedMenuImage, 0, 0, width, height);
  image(tenCostImage, 750, 35);
  image(twentyFiveCostImage, 753, 194);
  image(fiftyCostImage, 753, 340);
  image(oneHundredCostImage, 753, 490);
  image(oneThousandCostImage, 753, 625);
  image(backButtonImage, 650, 650);
  drawCurrency();
}

void drawInventory() {
  int inventoryStartX = 80;
  int inventoryStartY = height - 200;
  int slotSize = 60;
  int slotGap = 10;
  for (int i = 0; i < 8; i++) {
    if (i == selectedInventoryIndex) {
      stroke(255, 204, 0);
      strokeWeight(4);
    } else {
      noStroke();
    }
    int slotX = inventoryStartX + i * (slotSize + slotGap);
    fill(200, 200, 200, 150);
    rect(slotX, inventoryStartY, slotSize, slotSize);

    if (inventory[i] != null) {
      image(inventory[i].image, slotX + 5, inventoryStartY + 5);
      fill(0);
      textAlign(RIGHT, BOTTOM);
      textSize(14);
      text("x" + inventory[i].quantity, slotX + slotSize - 5, inventoryStartY + slotSize - 5);
    }
  }
  strokeWeight(1);
}

void drawCurrency() {
  fill(0, 0, 0, 180);
  rect(650, 600, 140, 50);
  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);
  text(characterCurrency, 690, 620);
  image(currencyCoin, 655, 610, width / 25, height / 25);
}

void mousePressed() {
  if (!gameStarted) {
    int startButtonFullWidth = startButtonWidth * 2;
    int startButtonFullHeight = startButtonHeight * 2;
    preGameSound.loop();

    if (mouseX >= startButtonPositionX && mouseX <= startButtonPositionX + startButtonFullWidth &&
      mouseY >= startButtonPositionY && mouseY <= startButtonPositionY + startButtonFullHeight) {
      preGameSound.stop();
      music1.loop();
      gameStarted = true;
    }
  } else if (inFrogLand || inSeedMenu || inEggLand || inBackpack) {
    if (mouseX >= 650 && mouseX <= 750 && mouseY >= 650 && mouseY <= 700) {
      click.play();
      inFrogLand = false;
      inSeedMenu = false;
      inEggLand = false;
      inBackpack = false;
      seedMenuMusic.stop();
      frogLandMusic.stop();
      eggLandMusic.stop();
      music1.loop();
    }

    if(inFrogLand) {
      showDoorNotification = true;
      doorCounter++;
      doorNotificationStartTime = millis();
      music1.pause();
      seedMenuMusic.stop();
      eggLandMusic.stop();
      int frogLandPosX = 500;
      int frogLandPosY = 200;
      int frogLandWidth = 150;
      int frogLandHeight = 200;
      if(mouseX >= frogLandPosX && mouseX <= frogLandPosX + frogLandWidth &&
        mouseY >= frogLandPosY && mouseY <= frogLandPosY + frogLandHeight) {
          click.play();
          seedMenuMusic.stop();
          frogLandMusic.pause();
          eggLandMusic.loop();
          inEggLand = true;
          inFrogLand = false;
        }
    }

    if(inEggLand) {
      int commonEggBuyX = 150;
      int commonEggBuyY = 310;
      int commonEggBuyWidth = 100;
      int commonEggBuyHeight = 30;
      if(mouseX >= commonEggBuyX && mouseX <= commonEggBuyX + commonEggBuyWidth &&
         mouseY >= commonEggBuyY && mouseY <= commonEggBuyY + commonEggBuyHeight) {
         buyCommonEgg();
      }

      int rareEggBuyX = 350;
      int rareEggBuyY = 310;
      int rareEggBuyWidth = 100;
      int rareEggBuyHeight = 30;
      if(mouseX >= rareEggBuyX && mouseX <= rareEggBuyX + rareEggBuyWidth &&
         mouseY >= rareEggBuyY && mouseY <= rareEggBuyY + rareEggBuyHeight) {
         buyRareEgg();
      }

      int specialEggBuyX = 550;
      int specialEggBuyY = 310;
      int specialEggBuyWidth = 100;
      int specialEggBuyHeight = 50;
      if(mouseX >= specialEggBuyX && mouseX <= specialEggBuyX + specialEggBuyWidth &&
         mouseY >= specialEggBuyY && mouseY <= specialEggBuyY + specialEggBuyHeight) {
         buySpecialEgg();
      }

      int legendEggBuyX = 270;
      int legendEggBuyY = 650;
      int legendEggBuyWidth = 100;
      int legendEggBuyHeight = 50;
      if(mouseX >= legendEggBuyX -50 && mouseX <= legendEggBuyX + legendEggBuyWidth &&
         mouseY >= legendEggBuyY - 40 && mouseY <= legendEggBuyY + legendEggBuyHeight) {
         buyLegendEgg();
      }

      int prismaticEggBuyX = 470;
      int prismaticEggBuyY = 650;
      int prismaticEggBuyWidth = 100;
      int prismaticEggBuyHeight = 50;
      if(mouseX >= prismaticEggBuyX + 10 && mouseX <= prismaticEggBuyX + prismaticEggBuyWidth &&
         mouseY >= prismaticEggBuyY - 40 && mouseY <= prismaticEggBuyY + prismaticEggBuyHeight ) {
         buyPrismaticEgg();
      }
    }

    if (inSeedMenu) {
      int buyPositionX = 300;
      int buyPositionY = 40;
      int buyWidth = 470;
      int buyHeight = 100;

      if (mouseX >= buyPositionX && mouseX <= buyPositionX + buyWidth &&
        mouseY >= buyPositionY && mouseY <= buyPositionY + buyHeight) {
        buyCarrotSeed();
      }
      if (mouseX >= buyPositionX && mouseX <= buyPositionX + buyWidth &&
        mouseY >= buyPositionY+150 && mouseY <= buyPositionY+150 + buyHeight) {
        buyMushroomSeed();
      }
      if (mouseX >= buyPositionX && mouseX <= buyPositionX + buyWidth &&
        mouseY >= buyPositionY+300 && mouseY <= buyPositionY+300 + buyHeight) {
        buyTomatoSeed();
      }
      if (mouseX >= buyPositionX && mouseX <= buyPositionX + buyWidth &&
        mouseY >= buyPositionY+450 && mouseY <= buyPositionY+450 + buyHeight) {
        buyStrawberrySeed();
      }
      if (mouseX >= buyPositionX && mouseX <= buyPositionX + buyWidth &&
        mouseY >= buyPositionY+600 && mouseY <= buyPositionY+600 + buyHeight) {
        buyDragonfruitSeed();
      }
    } else if (inBackpack) {
        int startX = 50;
        int startY = 100;
        int frogSize = 80;
        int padding = 20;
        int frogsPerRow = 5;

        for (int i = 0; i < ownedFrogs.size(); i++) {
            PImage currentFrog = ownedFrogs.get(i);
            int row = i / frogsPerRow;
            int col = i % frogsPerRow;
            int x = startX + col * (frogSize + padding);
            int y = startY + row * (frogSize + padding);

            if (mouseX >= x && mouseX <= x + frogSize &&
                mouseY >= y && mouseY <= y + frogSize) {
                froggy1 = currentFrog;
                froggy1.resize(60,60);
                click.play();
                break;
            }
        }
    }

  } else if (showShopOptions) {
    if (mouseX >= buyTextX && mouseX <= buyTextX + textOptionWidth &&
      mouseY >= buyTextY && mouseY <= buyTextY + textOptionHeight) {
      click.play();
      showShopOptions = false;
      inSeedMenu = true;
      seedMenuMusic.loop();
      music1.pause();
      frogLandMusic.stop();
    }
    else if (mouseX >= sellTextX && mouseX <= sellTextX + textOptionWidth &&
      mouseY >= sellTextY && mouseY <= sellTextY + textOptionHeight) {
      click.play();
      showShopOptions = false;
      sellAllInventory();
    } else {
        showShopOptions = false;
    }
  } else {
    if (mouseX >= storeSeedPositionX && mouseX <= storeSeedPositionX + storeSeedWidth &&
      mouseY >= storeSeedPositionY && mouseY <= storeSeedPositionY + storeSeedHeight) {
      showShopOptions = true;
      click.play();
    } else if (mouseX >= storeFrogPositionX && mouseX <= storeFrogPositionX + storeFrogWidth &&
      mouseY >= storeFrogPositionY && mouseY <= storeFrogPositionY + storeFrogHeight) {
      inFrogLand = true;
      click.play();
      music1.stop();
      frogLandMusic.loop();
    } else if (mouseX >= backpackIconX && mouseX <= backpackIconX + backpackIconWidth &&
      mouseY >= backpackIconY && mouseY <= backpackIconY + backpackIconHeight) {
      inBackpack = true;
      click.play();
    }
    else if (placingCarrotSeed) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedCarrots.add(new PlantedCarrot(plantingPosition, millis()));
      plantingSound.play();
      carrotPlanted = true;
      handleInventoryAfterPlanting("Carrot Seed");
    } else if (placingMushroomSeed) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedMushrooms.add(new PlantedMushroom(plantingPosition, millis()));
      plantingSound.play();
      mushroomPlanted = true;
      handleInventoryAfterPlanting("Mushroom Seed");
    } else if (placingTomatoSeed) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedTomatoes.add(new PlantedTomato(plantingPosition, millis()));
      plantingSound.play();
      tomatoPlanted = true;
      handleInventoryAfterPlanting("Tomato Seed");
    } else if (placingStrawberrySeed) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedStrawberries.add(new PlantedStrawberry(plantingPosition, millis()));
      plantingSound.play();
      strawberryPlanted = true;
      handleInventoryAfterPlanting("Strawberry Seed");
    } else if (placingDragonfruitSeed) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedDragonfruits.add(new PlantedDragonfruit(plantingPosition, millis()));
      plantingSound.play();
      dragonfruitPlanted = true;
      handleInventoryAfterPlanting("Dragonfruit Seed");
    } else if (placingCommonEgg) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedCommonEggs.add(new PlantedCommonEgg(plantingPosition, millis()));
      plantingSound.play();
      commonEggPlanted = true;
      handleInventoryAfterPlanting("Common Egg");
    } else if (placingRareEgg) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedRareEggs.add(new PlantedRareEgg(plantingPosition, millis()));
      plantingSound.play();
      rareEggPlanted = true;
      handleInventoryAfterPlanting("Rare Egg");
    } else if (placingSpecialEgg) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedSpecialEggs.add(new PlantedSpecialEgg(plantingPosition, millis()));
      plantingSound.play();
      specialEggPlanted = true;
      handleInventoryAfterPlanting("Special Egg");
    } else if (placingLegendEgg) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedLegendEggs.add(new PlantedLegendEgg(plantingPosition, millis()));
      plantingSound.play();
      legendEggPlanted = true;
      handleInventoryAfterPlanting("Legend Egg");
    } else if (placingPrismaticEgg) {
      PVector plantingPosition = new PVector(mouseX + worldPositionX - 30, mouseY);
      plantedPrismaticEggs.add(new PlantedPrismaticEgg(plantingPosition, millis()));
      plantingSound.play();
      prismaticEggPlanted = true;
      handleInventoryAfterPlanting("Prismatic Egg");
    }
  }

  // Harvesting logic (simplified and improved)
  harvestItems(plantedCarrots, 10000, grownCarrot, "Carrot", 20);
  harvestItems(plantedMushrooms, 1000, grownMushroom, "Mushroom", 50);
  harvestItems(plantedTomatoes, 1000, grownTomato, "Tomato", 100);
  harvestItems(plantedStrawberries, 1000, grownStrawberry, "Strawberry", 200);
  harvestItems(plantedDragonfruits, 1000, grownDragonfruit, "Dragonfruit", 500);

  // Egg hatching and adding to collection
  for (int i = plantedCommonEggs.size() - 1; i >= 0; i--) {
    PlantedCommonEgg egg = plantedCommonEggs.get(i);
    if (millis() - egg.plantedTime >= 1000) { // Hatched
      float screenX = egg.position.x - worldPositionX + 30;
      float screenY = egg.position.y;
      if (dist(mouseX, mouseY, screenX + egg.hatchedFrog.width / 2, screenY + egg.hatchedFrog.height / 2) < 20) {
        pop.play();
        plantedCommonEggs.remove(i);
      }
    }
  }
  for (int i = plantedRareEggs.size() - 1; i >= 0; i--) {
    PlantedRareEgg egg = plantedRareEggs.get(i);
    if (millis() - egg.plantedTime >= 1000) { // Hatched
      float screenX = egg.position.x - worldPositionX + 30;
      float screenY = egg.position.y;
      if (dist(mouseX, mouseY, screenX + egg.hatchedFrog.width / 2, screenY + egg.hatchedFrog.height / 2) < 20) {
        pop.play();
        plantedRareEggs.remove(i);
      }
    }
  }
  for (int i = plantedSpecialEggs.size() - 1; i >= 0; i--) {
    PlantedSpecialEgg egg = plantedSpecialEggs.get(i);
    if (millis() - egg.plantedTime >= 1000) { // Hatched
      float screenX = egg.position.x - worldPositionX + 30;
      float screenY = egg.position.y;
      if (dist(mouseX, mouseY, screenX + egg.hatchedFrog.width / 2, screenY + egg.hatchedFrog.height / 2) < 20) {
        pop.play();
        plantedSpecialEggs.remove(i);
      }
    }
  }
  for (int i = plantedLegendEggs.size() - 1; i >= 0; i--) {
    PlantedLegendEgg egg = plantedLegendEggs.get(i);
    if (millis() - egg.plantedTime >= 1000) { // Hatched
      float screenX = egg.position.x - worldPositionX + 30;
      float screenY = egg.position.y;
      if (dist(mouseX, mouseY, screenX + egg.hatchedFrog.width / 2, screenY + egg.hatchedFrog.height / 2) < 20) {
        pop.play();
        plantedLegendEggs.remove(i);
      }
    }
  }
  for (int i = plantedPrismaticEggs.size() - 1; i >= 0; i--) {
    PlantedPrismaticEgg egg = plantedPrismaticEggs.get(i);
    if (millis() - egg.plantedTime >= 1000) { // Hatched
      float screenX = egg.position.x - worldPositionX + 30;
      float screenY = egg.position.y;
      if (dist(mouseX, mouseY, screenX + egg.hatchedFrog.width / 2, screenY + egg.hatchedFrog.height / 2) < 20) {
        pop.play();
        plantedPrismaticEggs.remove(i);
      }
    }
  }
}

// Helper function for harvesting
void harvestItems(ArrayList<?> items, int harvestTime, PImage harvestedImage, String itemName, int sellPrice) {
  for (int i = items.size() - 1; i >= 0; i--) {
    Object item = items.get(i);
    int plantedTime = 0;
    PVector position = null;

    if (item instanceof PlantedCarrot) {
      plantedTime = ((PlantedCarrot)item).plantedTime;
      position = ((PlantedCarrot)item).position;
    } else if (item instanceof PlantedMushroom) {
      plantedTime = ((PlantedMushroom)item).plantedTime;
      position = ((PlantedMushroom)item).position;
    } else if (item instanceof PlantedTomato) {
      plantedTime = ((PlantedTomato)item).plantedTime;
      position = ((PlantedTomato)item).position;
    } else if (item instanceof PlantedStrawberry) {
      plantedTime = ((PlantedStrawberry)item).plantedTime;
      position = ((PlantedStrawberry)item).position;
    } else if (item instanceof PlantedDragonfruit) {
      plantedTime = ((PlantedDragonfruit)item).plantedTime;
      position = ((PlantedDragonfruit)item).position;
    }

    if (plantedTime != 0 && millis() - plantedTime >= harvestTime) {
      float screenX = position.x - worldPositionX + 30;
      float screenY = position.y;
      if (dist(mouseX, mouseY, screenX + harvestedImage.width / 2, screenY + harvestedImage.height / 2) < 20) {
        pop.play();
        addToInventory(itemName, harvestedImage, 1, sellPrice);
        items.remove(i);
      }
    }
  }
}


// Helper function to handle inventory updates after planting
void handleInventoryAfterPlanting(String seedName) {
  if (selectedInventoryIndex >= 0 && inventory[selectedInventoryIndex] != null) {
    inventory[selectedInventoryIndex].quantity--;
    if (inventory[selectedInventoryIndex].quantity <= 0) {
      inventory[selectedInventoryIndex] = null;
      selectedInventoryIndex = -1; // Deselect after planting last seed
      // Turn off placing modes
      placingCarrotSeed = false;
      placingMushroomSeed = false;
      placingTomatoSeed = false;
      placingStrawberrySeed = false;
      placingDragonfruitSeed = false;
      placingCommonEgg = false;
      placingRareEgg = false;
      placingSpecialEgg = false;
      placingLegendEgg = false;
      placingPrismaticEgg = false;
    }
  }
}

void buyCarrotSeed() {
  if (characterCurrency >= 10) {
    coin.play();
    characterCurrency -= 10;
    hasBoughtCarrotSeed = true;
    placingCarrotSeed = true;
    addToInventory("Carrot Seed", carrotSeedBag, 1, 0);
  }
}

void buyMushroomSeed() {
  if (characterCurrency >= 25) {
    coin.play();
    characterCurrency -= 25;
    hasBoughtMushroomSeed = true;
    placingMushroomSeed = true;
    addToInventory("Mushroom Seed", mushroomSeedBag, 1, 0);
  }
}

void buyTomatoSeed() {
  if (characterCurrency >= 50) {
    coin.play();
    characterCurrency -= 50;
    hasBoughtTomatoSeed = true;
    placingTomatoSeed = true;
    addToInventory("Tomato Seed", tomatoSeedBag, 1, 0);
  }
}

void buyStrawberrySeed() {
  if (characterCurrency >= 100) {
    coin.play();
    characterCurrency -= 100;
    hasBoughtStrawberrySeed = true;
    placingStrawberrySeed = true;
    addToInventory("Strawberry Seed", strawberrySeedBag, 1, 0);
  }
}

void buyDragonfruitSeed() {
  if (characterCurrency >= 1000) {
    coin.play();
    characterCurrency -= 1000;
    hasBoughtDragonfruitSeed = true;
    placingDragonfruitSeed = true;
    addToInventory("Dragonfruit Seed", dragonfruitSeedBag, 1, 0);
  }
}

void buyCommonEgg() {
  if (characterCurrency >= 10000) {
    coin.play();
    characterCurrency -= 10000;
    hasBoughtCommonEgg = true;
    placingCommonEgg = true;
    addToInventory("Common Egg", commonEgg, 1, 0);
  }
}

void buyRareEgg() {
  if (characterCurrency >= 50000) {
    coin.play();
    characterCurrency -= 50000;
    hasBoughtRareEgg = true;
    placingRareEgg = true;
    addToInventory("Rare Egg", rareEgg, 1, 0);
  }
}

void buySpecialEgg() {
  if (characterCurrency >= 100000) {
    coin.play();
    characterCurrency -= 100000;
    hasBoughtSpecialEgg = true;
    placingSpecialEgg = true;
    addToInventory("Special Egg", specialEgg, 1, 0);
  }
}

void buyLegendEgg() {
  if (characterCurrency >= 1000000) {
    coin.play();
    characterCurrency -= 1000000;
    hasBoughtLegendEgg = true;
    placingLegendEgg = true;
    addToInventory("Legend Egg", legendEgg, 1, 0);
  }
}

void buyPrismaticEgg() {
  if (characterCurrency >= 10000000) {
    coin.play();
    characterCurrency -= 10000000;
    hasBoughtPrismaticEgg = true;
    placingPrismaticEgg = true;
    addToInventory("Prismatic Egg", prismaticEgg, 1, 0);
  }
}
//buy shuo egg
/*void buyShuoEgg() {
  if (characterCurrency >= 50000) {
    coin.play();
    characterCurrency -= 50000;
    hasBoughtShuoEgg = true;
    placingShuoEgg = true;
    addToInventory("Shuo Egg", shuoEgg, 1, 0);
  }
}*/

void sellAllInventory() {
  int totalSoldValue = 0;
  for (int i = 0; i < inventory.length; i++) {
    if (inventory[i] != null && !inventory[i].name.contains("Seed") && !inventory[i].name.contains("Egg")) {
      totalSoldValue += (inventory[i].quantity * inventory[i].sellPrice);
      inventory[i] = null;
    }
  }

  if (totalSoldValue > 0) {
    coin.play();
    characterCurrency += totalSoldValue;
    amountSoldFor = totalSoldValue;
    showSellNotification = true;
    sellNotificationStartTime = millis();
    hasSoldFirstItem = true;
    instructionChanged = false;
  }
}

void keyPressed() {
  if (!gameStarted) return;

  if (key == CODED) {
    if (keyCode == RIGHT) {
      currentInstructionIndex++;
      if (currentInstructionIndex >= instructions.length) {
        currentInstructionIndex = 0;
      }
    }
  }

  if (!inFrogLand && !inSeedMenu && !showShopOptions && !inEggLand && !inBackpack) {
    if (key == 'a' || key == 'A') {
      frogPositionX -= 3;
      worldPositionX -= 3;
      if (worldPositionX < 0) worldPositionX = 0;
    }
    if (key == 'd' || key == 'D') {
      frogPositionX += 3;
      worldPositionX += 3;
      if (worldPositionX > 800) worldPositionX = 800;
    }
    if (key == 'w' || key == 'W') {
      frogPositionY -= 3;
    }
    if (key == 's' || key == 'S') {
      frogPositionY += 3;
    }

    frogPositionX = constrain(frogPositionX, 0, width - froggy1.width);
    frogPositionY = constrain(frogPositionY, 0, height - froggy1.height);
  }
  if (key >= '0' && key <= '7') {
    selectedInventoryIndex = key - '0';

    // Reset all placing modes
    placingCarrotSeed = false;
    placingMushroomSeed = false;
    placingTomatoSeed = false;
    placingStrawberrySeed = false;
    placingDragonfruitSeed = false;
    placingCommonEgg = false;
    placingRareEgg = false;
    placingSpecialEgg = false;
    placingLegendEgg = false;
    placingPrismaticEgg = false;

    if (inventory[selectedInventoryIndex] != null) {
        String itemName = inventory[selectedInventoryIndex].name;
        if (itemName.equals("Carrot Seed")) {
          placingCarrotSeed = true;
        } else if (itemName.equals("Mushroom Seed")) {
          placingMushroomSeed = true;
        } else if (itemName.equals("Tomato Seed")) {
          placingTomatoSeed = true;
        } else if (itemName.equals("Strawberry Seed")) {
          placingStrawberrySeed = true;
        } else if (itemName.equals("Dragonfruit Seed")) {
          placingDragonfruitSeed = true;
        } else if (itemName.equals("Common Egg")) {
          placingCommonEgg = true;
        } else if (itemName.equals("Rare Egg")) {
          placingRareEgg = true;
        } else if (itemName.equals("Special Egg")) {
          placingSpecialEgg = true;
        } else if (itemName.equals("Legend Egg")) {
          placingLegendEgg = true;
        } else if (itemName.equals("Prismatic Egg")) {
          placingPrismaticEgg = true;
        }
    }
  }

  if (key == 'y' || key == 'Y') {
    isSpinning = true;
    spinStartTime = millis();
    spinAngle = 0;
  }
}

void addToInventory(String itemName, PImage itemImage, int quantityToAdd, int sellPrice) {
  for (int i = 0; i < inventory.length; i++) {
    if (inventory[i] != null && inventory[i].name.equals(itemName)) {
      inventory[i].quantity += quantityToAdd;
      return;
    }
  }

  for (int i = 0; i < inventory.length; i++) {
    if (inventory[i] == null) {
      inventory[i] = new InventoryItem(itemName, itemImage, quantityToAdd, sellPrice);
      return;
    }
  }
}

void drawSellNotification() {
  if (millis() - sellNotificationStartTime < 5000) {
    fill(0, 0, 0, 180);
    rectMode(CENTER);
    rect(width / 2, height / 2, 400, 60, 10);
    rectMode(CORNER);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("inventory sold for " + amountSoldFor + " coins.", width / 2, height / 2);
  } else {
    showSellNotification = false;
  }
}

void drawDoorNotification() {
  if (millis() - doorNotificationStartTime < 5000) {
    fill(0, 0, 0, 180);
    rectMode(CENTER);
    rect(width / 2, height / 2, 400, 60, 10);
    rectMode(CORNER);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("The mysterious door leads to the Egg Land!", width / 2, height / 2);
  } else {
    showDoorNotification = false;
  }
}
