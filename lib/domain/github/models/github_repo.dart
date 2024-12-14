/// Github仓库信息
enum GithubRepo {
  hot_searches_for_apps('hot_searches_for_apps', 'WShuai123'),
  rii3bi('rii3bi', 'Chaos-woo'),
  bit1('1bit', 'Chaos-woo');

  final String repo;
  final String owner;

  const GithubRepo(this.repo, this.owner);
}
