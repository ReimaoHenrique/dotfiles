-- --------------------------
-- ---- ENVIRONMENT VARIABLES ----
-- --------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")

hl.env("PATH", os.getenv("PATH") .. ":" .. os.getenv("HOME") .. "/.local/bin")
