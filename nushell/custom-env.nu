# Nupm path
$env.NUPM_HOME = ($env.HOME | path join "Software" "nupm")
$env.NU_LIB_DIRS = [
    ($env.NUPM_HOME | path join "modules")
]

$env.EDITOR = "nvim"

$env.PATH = ($env.PATH |
    split row (char esep) |
    # npm global prefix
    append /home/last/Software/npm-global/bin |
    # nupm scripts dir
    prepend ($env.NUPM_HOME | path join "scripts")
)
# make sure paths are unique
$env.PATH = ($env.PATH | uniq)

