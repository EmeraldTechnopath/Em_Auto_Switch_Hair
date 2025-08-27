This script auto-switches your character's (or a companion, if you set it that way) hair to a different hair when camp clothes are equipped. There's also an extra slot where you can add hair extensions or other CC item (like piercings).

**Limitations:**

- When you change between armor and camp sets in the inventory screen, you will have to close the screen and reopen it to see the changes.
- Currently, if you change the "daytime" hair mid-game using AEE or mirror, it will cause multiple hairs to stack on top of each other. You can get around this by setting your CURRENT hair UUID in the oldHair variable in the script, and your NEW hair UUID in the dayHair variable. Then swap to camp clothes and back. Your hair should now be changed.
- It seems like you can change the "nighttime" hair at any time by just changing the nightHair variable.
- Multiplayer or multi-Tav games won't work since you'd have multiple players at once. You could potentially get around this by setting the targetCharacter to your Tav's UUID.

**Permissions:**

You are welcome to use my script in your mod. Please credit back to this page!

**Credits:**

Part of the script was written by Wesslen.
Thanks also to Norbyte, Astralities, commanderstrawberry, whatsontheflip, kelocena, and c__hampagne for assistance with this mod.
