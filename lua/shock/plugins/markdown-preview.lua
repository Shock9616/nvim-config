--
-- markdown-preview.lua
--
-- Browser-based rendering of markdown files
--

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app; yarn install",
}
