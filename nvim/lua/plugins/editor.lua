return {
  -- Allows you to move the cursor quickly to words that
  -- match a set pattern
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      prompt = {
        prefix = { { "🛸", "FlashPromptIcon" } },
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)

      -- Because some themes (such as onenord) do not yet have flash support, you
      -- must manually apply styling to differentiate the jump tag (letter that
      -- must be clicked to jump to the word) to differentiate it.
      local colors = require("onenord.colors").load()
      vim.api.nvim_set_hl(0, "FlashLabel", { bg = colors.light_gray, fg = colors.white, bold = true })
    end,
  },
}
