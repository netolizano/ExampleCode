using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataLayer;
using AutoMapper;
using System.Data.Entity.Core.Objects;

namespace BusinessLayer
{
    public class EmployeeBL
    {


        //database connection is created using entity framework 
        DatabaseEntities _db;
        //Error List 
        public List<ErrorET> Errors = new List<ErrorET>();
        //The business rules need to be written here
               
        /// <summary>
        /// Employee Model Validations 
        /// </summary>
        /// <param name="employee">Employee to validate</param>
        /// <returns>IsValid</returns>
        private bool ValidateModel(EmployeeET employee)
        {
            bool isValid = true;
           
            //Example: Hiring date must be less than the current date
            if (DateTime.Compare(employee.HireDate,DateTime.Now)>0)
            {
                //add error 
                //these errors can be part of the user manual, in order to describe more information
                Errors.Add(new ErrorET("E01", "Hire date cannot be greater than the current day"));
                isValid = false;
            }
            return isValid;
        }

        /// <summary>
        /// Insert Operation for Employee
        /// </summary>
        /// <param name="employee"></param>
        /// <returns>boolean value</returns>
        public bool Insert(EmployeeET employee)
        {
            try
            {
                if (ValidateModel(employee))
                {
                    _db = new DatabaseEntities();
                    _db.SP_Employee_Insert(employee.EmployeeLastName,
                    employee.EmployeeFirstName,
                    employee.EmployeePhone,
                    employee.EmployeeZip,
                    employee.HireDate);
                    _db.SaveChanges();
                    _db.Dispose();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                //exceptions handlers should be written here 
                throw;
            }
        }
        /// <summary>
        /// Update operation for employee
        /// </summary>
        /// <param name="employee"></param>
        /// <returns></returns>
        public bool Update(EmployeeET employee)
        {
            try
            {
                if (ValidateModel(employee))
                {
                    _db = new DatabaseEntities();
                    _db.SP_Employee_Update(employee.EmployeeID,
                    employee.EmployeeLastName,
                    employee.EmployeeFirstName,
                    employee.EmployeePhone,
                    employee.EmployeeZip,
                    employee.HireDate);
                    _db.SaveChanges();
                    _db.Dispose();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                //exceptions handlers should be written here 
                throw;
            }
        }

        /// <summary>
        /// Delete operation for employee
        /// </summary>
        /// <param name="EmployeeID">Id of employee</param>
        /// <returns></returns>
        public bool Delete(int EmployeeID)
        {
            try
            {
                if (CanDelete(EmployeeID))
                {
                    _db = new DatabaseEntities();
                    _db.SP_Employee_Delete(EmployeeID);
                    _db.SaveChanges();
                    _db.Dispose();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {

                throw;
            }
        }
        
        private bool CanDelete(int employeeID)
        {
            //Here you write the rules that need to be check before deleting one register
            //since we don't have more tables to check the operations is allowed
            return true;
        }
        /// <summary>
        /// Get all employees
        /// </summary>
        /// <returns></returns>
        public List<EmployeeET> GetAll()
        {
            _db = new DatabaseEntities();
            ObjectResult<Employee> items = _db.Sp_Employee_GetAll();

            List<EmployeeET> employees = new List<EmployeeET>();
            foreach (Employee item in items)
            {
                ////autogenerate mapping
                var employee = Mapper.Map<Entities.EmployeeET>(item);
                employees.Add(employee);
            }

            return employees;
        }

        /// <summary>
        /// Find employees by lastName
        /// </summary>
        /// <param name="lastName"></param>
        /// <returns></returns>
        public List<EmployeeET> GetByLastName(string lastName)
        {
            _db = new DatabaseEntities();
            ObjectResult<Employee> items = _db.Sp_Employee_GetByLastName(lastName);

            List<EmployeeET> employees = new List<EmployeeET>();
            foreach (Employee item in items)
            {
                var employee = Mapper.Map<Entities.EmployeeET>(item);
                employees.Add(employee);
            }

            return employees;
        }
        /// <summary>
        /// GetEmployee by phone
        /// </summary>
        /// <param name="phone"></param>
        /// <returns></returns>
        public EmployeeET GetByPhone(string phone)
        {
            _db = new DatabaseEntities();
            Employee emp = _db.Sp_Employee_GetByPhone(phone).SingleOrDefault();
            EmployeeET employee = new EmployeeET();
            if (emp!=null)
            {
                //autogenerate mapping
                employee = Mapper.Map<Entities.EmployeeET>(emp);
            }
            return employee;
        }
    }
}
