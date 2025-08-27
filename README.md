This script auto-switches your character's (or a companion, if you set it that way) hair to a different hair when camp clothes are equipped.

**Limitations:**

- Currently, if you change the "daytime" hair mid-game using AEE or mirror, it will cause multiple hairs to stack on top of each other. You can get around this by setting your OLD hair UUID in the oldHair variable in the script, and your NEW hair UUID in the dayHair variable. Then swap to camp clothes and back. Your hair should now be changed.
- Multiplayer or multi-Tav games won't work since you'd have multiple players at once. You could potentially get around this by setting the targetCharacter to your Tav's UUID.

**Credits:**

Part of the script was written by Wesslen.
Thanks also to Norbyte, Astralities, commanderstrawberry, whatsontheflip, kelocena, and c__hampagne for assistance with this mod.
