require('bufferline').setup {
  options = {
    view = "multiwindow",
    numbers = "none",
    number_style = "superscript", -- buffer_id at index 1, ordinal at index 2
    mappings = false,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    offsets = {{filetype = "NERDTree", text = "File Explorer", highlight = "Directory"}},
    show_buffer_icons = true, 
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, 
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true
  }
}
