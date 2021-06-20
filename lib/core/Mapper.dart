abstract class Mapper<T, DomainMapper> {
  DomainMapper mapToDomainModel(T t);

  T mapFromDomainModel(DomainMapper domainMapper);
}
