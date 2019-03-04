
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/03/2019 22:41:30
-- Generated from EDMX file: C:\git\GrandCircus\GrandCircus\StudentModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-GrandCircus-20190303094708];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Course]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Course];
GO
IF OBJECT_ID(N'[dbo].[Enroll]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Enroll];
GO
IF OBJECT_ID(N'[dbo].[Student]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Student];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [Category] nchar(10)  NOT NULL
);
GO

-- Creating table 'Enrolls'
CREATE TABLE [dbo].[Enrolls] (
    [ID] int  NOT NULL,
    [StudentID] int  NOT NULL,
    [CourseID] int  NOT NULL,
    [Grade] nvarchar(max)  NULL,
    [EnrollmentDate] datetime  NOT NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [PhoneNumber] nchar(10)  NULL,
    [Address] nvarchar(max)  NULL
);
GO

-- Creating table 'StudentCourse'
CREATE TABLE [dbo].[StudentCourse] (
    [Students_ID] int  NOT NULL,
    [Courses_ID] int  NOT NULL
);
GO

-- Creating table 'StudentEnroll'
CREATE TABLE [dbo].[StudentEnroll] (
    [Students_ID] int  NOT NULL,
    [Enrolls_ID] int  NOT NULL
);
GO

-- Creating table 'CourseEnroll'
CREATE TABLE [dbo].[CourseEnroll] (
    [Courses_ID] int  NOT NULL,
    [Enrolls_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Enrolls'
ALTER TABLE [dbo].[Enrolls]
ADD CONSTRAINT [PK_Enrolls]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Students_ID], [Courses_ID] in table 'StudentCourse'
ALTER TABLE [dbo].[StudentCourse]
ADD CONSTRAINT [PK_StudentCourse]
    PRIMARY KEY CLUSTERED ([Students_ID], [Courses_ID] ASC);
GO

-- Creating primary key on [Students_ID], [Enrolls_ID] in table 'StudentEnroll'
ALTER TABLE [dbo].[StudentEnroll]
ADD CONSTRAINT [PK_StudentEnroll]
    PRIMARY KEY CLUSTERED ([Students_ID], [Enrolls_ID] ASC);
GO

-- Creating primary key on [Courses_ID], [Enrolls_ID] in table 'CourseEnroll'
ALTER TABLE [dbo].[CourseEnroll]
ADD CONSTRAINT [PK_CourseEnroll]
    PRIMARY KEY CLUSTERED ([Courses_ID], [Enrolls_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Students_ID] in table 'StudentCourse'
ALTER TABLE [dbo].[StudentCourse]
ADD CONSTRAINT [FK_StudentCourse_Student]
    FOREIGN KEY ([Students_ID])
    REFERENCES [dbo].[Students]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Courses_ID] in table 'StudentCourse'
ALTER TABLE [dbo].[StudentCourse]
ADD CONSTRAINT [FK_StudentCourse_Course]
    FOREIGN KEY ([Courses_ID])
    REFERENCES [dbo].[Courses]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentCourse_Course'
CREATE INDEX [IX_FK_StudentCourse_Course]
ON [dbo].[StudentCourse]
    ([Courses_ID]);
GO

-- Creating foreign key on [Students_ID] in table 'StudentEnroll'
ALTER TABLE [dbo].[StudentEnroll]
ADD CONSTRAINT [FK_StudentEnroll_Student]
    FOREIGN KEY ([Students_ID])
    REFERENCES [dbo].[Students]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Enrolls_ID] in table 'StudentEnroll'
ALTER TABLE [dbo].[StudentEnroll]
ADD CONSTRAINT [FK_StudentEnroll_Enroll]
    FOREIGN KEY ([Enrolls_ID])
    REFERENCES [dbo].[Enrolls]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentEnroll_Enroll'
CREATE INDEX [IX_FK_StudentEnroll_Enroll]
ON [dbo].[StudentEnroll]
    ([Enrolls_ID]);
GO

-- Creating foreign key on [Courses_ID] in table 'CourseEnroll'
ALTER TABLE [dbo].[CourseEnroll]
ADD CONSTRAINT [FK_CourseEnroll_Course]
    FOREIGN KEY ([Courses_ID])
    REFERENCES [dbo].[Courses]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Enrolls_ID] in table 'CourseEnroll'
ALTER TABLE [dbo].[CourseEnroll]
ADD CONSTRAINT [FK_CourseEnroll_Enroll]
    FOREIGN KEY ([Enrolls_ID])
    REFERENCES [dbo].[Enrolls]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseEnroll_Enroll'
CREATE INDEX [IX_FK_CourseEnroll_Enroll]
ON [dbo].[CourseEnroll]
    ([Enrolls_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------