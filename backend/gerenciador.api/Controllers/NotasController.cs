using gerenciador.api.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace gerenciador.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotasController : ControllerBase
    {
        private readonly NotaFiscalContext _context;
        public NotasController(NotaFiscalContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            var notas = await _context.Notas.ToListAsync();
            return Ok(notas);
        }
        [HttpGet("{id:int}")]
        public async Task<ActionResult<NotaFiscal>> GetById(int id)
        {
            var nota = await _context.Notas.FindAsync(id);
            if (nota == null)
            {
                return NotFound();
            }
            return Ok(nota);
        }
        [HttpPost]
        public async Task<ActionResult<NotaFiscal>> Post([FromBody] NotaFiscal nota)
        {
            _context.Notas.Add(nota);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = nota.Id }, nota);
        }
    }
}
