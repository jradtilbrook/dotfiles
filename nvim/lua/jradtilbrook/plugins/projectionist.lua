return {
    "tpope/vim-projectionist",
    lazy = false,
    dependencies = {
        "tpope/vim-dispatch",
    },
    config = function()
        vim.g.projectionist_heuristics = {
            artisan = {
                ["*"] = {
                    start = "sail up",
                    console = "sail tinker",
                    make = "npm run dev",
                },
                ["app/Models/*.php"] = {
                    type = "model",
                },
                ["app/Http/Controllers/*.php"] = {
                    type = "controller",
                },
                ["routes/*.php"] = {
                    type = "route",
                },
                ["database/migrations/*.php"] = {
                    type = "migration",
                },
                ["app/*.php"] = {
                    type = "source",
                    alternate = {
                        "tests/Feature/{}Test.php",
                        "tests/Unit/{}Test.php",
                    },
                },
                ["tests/Feature/*Test.php"] = {
                    type = "test",
                    alternate = "app/{}.php",
                },
                ["tests/Unit/*Test.php"] = {
                    type = "test",
                    alternate = "app/{}.php",
                },
            },
            ["go.mod"] = {
                ["*.go"] = {
                    type = "source",
                    alternate = {
                        "{}_test.go",
                    },
                },
                ["*_test.go"] = {
                    type = "test",
                    alternate = {
                        "{}.go",
                    },
                },
            },
        }
    end,
}
