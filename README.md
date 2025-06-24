
# 🗺️ SP Blip Creator

A lightweight FiveM script that allows admins to create **custom blips in-game** using a modern NUI panel — with real-time map updates and automatic saving to `config.lua`.

---

## 📦 Features

- 🔘 In-game UI to enter blip name, sprite ID, color ID, and scale  
- 🧠 Blips appear instantly on the map  
- 💾 Blips are saved to `config.lua` automatically  
- ♻️ Blips are reloaded when the server/resource restarts  
- 🔒 Supports admin-only usage (via Steam hex whitelist)  
- 🎨 Sleek modern UI using plain input fields  

---

## 📸 Preview

![Preview of the Blip Creator UI](https://ibb.co/v4YrMykX)
https://ibb.co/v4YrMykX
https://ibb.co/svgFynbv

---

## 🚀 Installation

1. Download or clone this repo:

   ```bash
   git clone https://github.com/yourusername/sp_blipcreator.git
   ```

2. Place the folder inside your `resources/` directory.

3. Add this line to your `server.cfg`:
   ```
   ensure sp_blipcreator
   ```

4. Edit `config.lua` and add your Steam hex under `Config.Allowed`.

---

## ✏️ Usage

In-game, type:

```bash
/blipcreator
```

Fill out the fields:

- **Blip Name**  
- **Sprite ID** (see sprite list below)  
- **Color ID**  
- **Scale**

Hit ✅ **Create** to spawn the blip on the map.

---

## 🔧 Config

Example `config.lua`:

```lua
Config = {}

Config.Allowed = {
    "steam:11000011abc12345", -- allowed admin(s)
}

Config.SavedBlips = {
    -- auto-filled by the system when blips are created
}
```

---

## 🎯 Sprite & Color References

- [Blip Sprites](https://docs.fivem.net/docs/game-references/blips/)  
- [Blip Colors](https://docs.fivem.net/docs/game-references/blip-colors/)

---

## ✅ Future Ideas

- ❌ Delete a specific blip  
- 🗃️ Export blips to a JSON/DB  
- 🎓 Job-restricted blips

---

## 📄 License

This project is open-source under the [MIT License](LICENSE).

---

> 💬 Need help or want features added? Open an issue or contact **Discord : Spidey6629**.
