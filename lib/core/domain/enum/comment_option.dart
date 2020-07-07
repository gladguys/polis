enum CommentOption {
  edit,
  delete,
}

String commentOptionToString(CommentOption option) {
  return option == CommentOption.edit ? 'Editar' : 'Excluir';
}
