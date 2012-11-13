Repository-Pattern-in-Objective-C
=================================

An implementation of [Repository](http://martinfowler.com/eaaCatalog/repository.html) and [Unit Of Work](http://martinfowler.com/eaaCatalog/unitOfWork.html) pattern in Objective-C. This project provide you a template to implement DAO layer in iOS project, including concurrency update database.

How to use it?
=================================

1. Create Model classes
---------------------------------
Start creating your model class using Core Data designer or just create POCO class. Inherit your model classes from BaseModel class or BaseManagedObjectModel class included in project, BaseMode is pure POCO class, BaseManageObjectModel class is class inherited from NSManagedObject class incase you used Core Data designer to generate model classes. See BaseModel and BaseManagedObjectModel class for reference.

2. Create Repository classes
---------------------------------
Drag Repositories and Liraries folder to your project.

<p><b>+ Generic folder: </b></p>
This folder contains all Repository interfaces.

<p>
	- <b>RPIRepository</b>: generic repository interface, it describe abstract methods for a repository, all your custom repository interface must inherite from this interface. You just don't have to modify anything in this interface, just let it be there.

<p>
	- <b>RPIDbUnitOfWork</b>: this is unit of work interface, it describes all repository properties like this:
</p>

<blockquote>
<p>@protocol RPIDbUnitOfWork</p>
<p>@required</p>
<p>// User repository for User model</p>
<p>@property(nonatomic,strong,readonly) id<RPIRepository> userRepository; </p>
<p>// Photo repository for Photo model</p>
<p>@property(nonatomic,strong,readonly) RPIPhotoRepository photoRepository; </p>
<p>....</p>
<p>@end</p>
</blockquote>

<p>
	You need to describe repository property to return an instance of repository class.
</p>
<p>
<p><b>+ Implements folder: </b></p>
This folder contains all Repository implementations.
<p>
<p>
	- <b>RPCoreDataUnitOfWork</b>: an implementation of RPIDbUnitOfWork interface, you can return an repository instance with your model class without creating new implementation files by define:
	<blockquote>
		<p>- (id<RPIRepository>) xxxRepository{</p>
		    <p>return [[RPGenericRepository alloc] initWithDbContext:dbContext withModel:[YOUR_MODEL_CLASS class]];</p>
		<p>}</p>
	</blockquote>
	Or if you had to create custom repository implementation, just create new one and return its instance like this:
	<blockquote>
		<p>- (id<RPICityRepository>) cityRepository{</p>
		    <p>return [[RPCityRepository alloc] initWithDbContext:dbContext withModel:[City class]];</p>
		<p>}</p>
	</blockquote>
	See <b>RPWeatherRepository</b> and <b>RPCityRepository</b> class for example. Simply replace or remove these repositories with your own repositories.
</p>

3. Usage through UnitOfWork
---------------------------------

<p><b>1. Get unit of work single instance</b></p>
    id unitOfWork = [UnitOfWork sharedInstance];
<p><b>2. Get a repository</b></p>
    id repository   = [unitOfWork userRepository];
<p><b>3. Make changes</b></p>
    User *user 	  = [repository create];
    user.name 	  = @"User 1";
<p><b>4. Save changes</b></p>
    [unitOfWork saveChanges];
