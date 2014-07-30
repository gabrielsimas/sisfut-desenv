// -----------------------------------------------------------------------
// <copyright file="Confederacao.cs" company="CS Services Consultoria em Sistemas">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Camada.Entidade
{
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Text;
	using System.Reflection;

	/// <summary>
	/// Entidade Confederação
	/// </summary>
	public class Confederacao
	{
		
		#region Enum

		public enum TipoConfederacao: int
		{
		   Continental = 1,
		   Nacional = 2,
		   Regional = 3
		}

		#endregion

		#region Atributos

		private Nullable<long> id;
		private String nomeCompleto;
		private String apelido;
		private DateTime dataFundacao;
		private String distintivo;
		private TipoConfederacao tpConfederacao;
		private String pais;
		private IList<Confederacao> membros;
		private IList<Clube> clubes;
		private IList<Campeonato> campeonatos;
		
		#endregion

		#region Construtores
		public Confederacao()
		{

		}

		public Confederacao(Nullable<long> id, String nomeCompleto, String apelido, DateTime dataFundacao, TipoConfederacao tipoConfederacao, IList<Confederacao> membros, IList<Clube> clubes, IList<Campeonato> campeonatos, String distintivo, String pais)
		{
			this.id = id;
			this.nomeCompleto = nomeCompleto;
			this.apelido = apelido;
			this.dataFundacao = dataFundacao;
			this.tpConfederacao = tipoConfederacao;
			this.membros = membros;
			this.clubes = clubes;
			this.campeonatos = campeonatos;
			this.distintivo = distintivo;
			this.pais = pais;
		}
		#endregion

		#region Propriedades
		public virtual Nullable<long> Id { get; set; }

		public virtual String NomeCompleto
		{
			get
			{
				return this.nomeCompleto;
			}

			set
			{
				this.nomeCompleto = value;
			}
		}

		public virtual String Apelido
		{
			get
			{
				return this.apelido;
			}

			set
			{
				this.apelido = value;
			}
		}

		public virtual DateTime DataFundacao
		{
			get
			{
				return this.dataFundacao;
			}

			set
			{
				this.dataFundacao = value;
			}
		}

		public virtual String Distintivo {
			get
			{
				return this.distintivo;
			}

			set
			{
				this.distintivo = value;
			}
		}

		public virtual TipoConfederacao TpConfederacao
		{
			get
			{
				return this.tpConfederacao;
			}

			set
			{
				this.tpConfederacao = value;
			}
		}

		public virtual IList<Confederacao> Membros
		{
			get
			{
				return this.membros;
			}

			set
			{
				this.membros = value;
			}
		}

		public virtual IList<Clube> Clubes
		{
			get
			{
				return this.clubes;
			}

			set
			{
				this.clubes = value;
			}
		}

		public virtual IList<Campeonato> Campeonatos
		{
			get
			{
				return this.campeonatos;
			}

			set
			{
				this.campeonatos = value;
			}
		}

		public virtual String Pais
		{
			get
			{
				return this.pais;
			}

			set
			{
				this.pais = value;
			}
		}

		#endregion

		#region Classe Rica

		public override bool Equals(object obj)
		{
			if (obj is Confederacao)
			{
				Confederacao objeto = (Confederacao)obj;

				if (objeto.Id != null && this.id != null)
				{
					return objeto.Id.Equals(this.id);
				}
			}

			return false;
		}

		public override string ToString()
		{
			FieldInfo[] atributos;
			atributos = GetType().GetFields(BindingFlags.NonPublic);
			return atributos.ToString();
		}

		public override int GetHashCode()
		{
			return this.id.HasValue ? this.id.GetHashCode() : 0;
		}

		#endregion

	}
}
